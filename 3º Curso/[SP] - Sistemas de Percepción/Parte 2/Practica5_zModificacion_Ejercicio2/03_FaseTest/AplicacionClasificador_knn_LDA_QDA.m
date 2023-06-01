clear, clc, close all

pathAnterior = "02_FaseEntrenamiento_knn_LDA_QDA/";
pathActual = "03_FaseTest/";

addpath('Funciones')

nombreImagen = "ImagenesLetras/ImagenesTest/E3.tif";

%% GENERACION DE DATOS DE LA IMAGEN

I = imread(nombreImagen);

umbral = graythresh(I); % Obtiene umbral de rango 0-1

Ibin = I < 255*umbral;

IbinFilt = funcion_elimina_regiones_ruidosas(Ibin);

if sum(IbinFilt(:) > 0)
    [Ietiq, N] = bwlabel(IbinFilt);
    % Por cada objeto de la imagen, calculamos sus descriptores 
    XImagen = funcion_calcula_descriptores_imagen(Ietiq,N);
else
    XImagen = [];
end


%% 3. ESTANDARIZAR DATOS

% Cargamos medias y desviaciones de estandarización
ruta = "DatosGenerados/";
nombreArchivo = "datos_estandarizados.mat";
load(ruta + nombreArchivo);

numObjetos = N;
numDescriptores = size(XImagen, 2);

XImagenS = XImagen;

for i = 1:numDescriptores
    if desviaciones(i) == 0
        desviaciones(i) = eps;
    end
    XImagenS(:, i) = (XImagen(:,i)-medias(i))/(desviaciones(i)+eps); 
end

%% 4.- CARGAR INFORMACIÓN PARA LA APLICACIÓN DE LOS CLASIFICADORES
%% A UTILIZAR SEGÚN LA ESTRATEGIA DE CLASIFICACIÓN DISEÑADA

% Cargar Informacion knn - AD - B- CEFG

nombreArchivo = "DatosGenerados/espacioCcas_knn_AD_B_CEFG.mat";
load(pathAnterior + nombreArchivo);

espacioCcas_AD_B_CEFG = espacioCcas;
XTrain_AD_B_CEFG = XoI;
YTrain_AD_B_CEFG = YoI;
nombres_AD_B_CEFG = nombresProblema;

% Cargar Informacion LDA - A - D

nombreArchivo = "DatosGenerados/espacioCcas_LDA_A_D.mat";
load(pathAnterior + nombreArchivo);

d12_A_D = d12;
coeficientes_A_D = coeficientes_d12;
espacioCcas_A_D = espacioCcas;
XTrain_A_D = XoI;
YTrain_A_D = YoI;
nombres_A_D = nombresProblemaOI;

% Cargar Informacion QDA - C -E - F - G

nombreArchivo = "DatosGenerados/espacioCcas_QDA_CEFG.mat";
load(pathAnterior + nombreArchivo); 

espacioCcas_C_E_F_G = espacioCcas;
XTrain_C_E_F_G = XoI;
YTrain_C_E_F_G = YoI;
nombres_C_E_F_G = nombresProblemaOI;

%% EVALUAMOS CLASIFICADORES PARA CADA OBJETO

% Aplicar KNN

k = 5;
tipoDistancia = "Euclidea";
codifClases = unique(YTrain_AD_B_CEFG);
color = [0 255 0];

XoI = XImagenS(:, espacioCcas_AD_B_CEFG);

YoI = funcion_knn(XoI, XTrain_AD_B_CEFG, YTrain_AD_B_CEFG, k, tipoDistancia);


%% 5.- APLICACIÓN DE CLASIFICADORES PARA EL RECONOCIMIENTO DE CADA OBJETO

for i=1:numObjetos
    YiOI = YoI(i);

    posClaseOI = find(ismember(codifClases, YiOI)); % 1 = AD, 2 = B, CEFG = 3

    Xi = XImagenS(i,:);

    if posClaseOI == 2 % B
        claseOI = nombres_AD_B_CEFG.clases{posClaseOI};
        reconocimiento = ["Reconocimiento objeto: " claseOI];
        color = [0 255 0];
    elseif posClaseOI == 1 % AD
        % Clasificador AD
        XiOI = Xi(1, espacioCcas_A_D);
        X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
        valor_d12CircTrian = eval(d12_A_D);
        if valor_d12CircTrian>0  % A
            claseOI = nombres_A_D.clases{1};
            reconocimiento = {"Reconocimiento Objeto: " claseOI};
            color = [0 0 255];
        else % D
            claseOI = nombres_A_D.clases{2};
            reconocimiento = {"Reconocimiento Objeto: " claseOI};
            color = [0 0 255];
        end
    else
        XTest = XImagenS(:, espacioCcas_C_E_F_G);
        codifClases_C_E_F_G = unique(YTrain_C_E_F_G);
        [Yp, d] = funcion_aplica_QDA(XTest, vectorMedias, matricesCovarianzas, probabilidadPriori, codifClases);
        % Yp = prediccion de Y, tenemos la codificacion
        posClaseOI = Yp(i);
        % posClaseOI = find(ismember(codifClases_C_E_F_G, YiOI));
        claseOI = nombres_C_E_F_G.clases{posClaseOI};
        reconocimiento = ["Reconocimiento objeto: " claseOI];
    end

    Ib = Ietiq == i;
    
    %% 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
    %% DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO

    figure,
    subplot(1,2,1), funcion_visualiza(I, Ib, color, true);
    title(reconocimiento)

    %% 6.2.- En el caso de tratar con espacios de características de dos o tres dimensiones, REPRESENTACIÓN DE LA INSTANCIA DE TEST, JUNTO CON LAS %% DE TRAIN EN EL ESPACIO DE CARACTERÍSTICAS UTILIZADO. SI LA TÉCNICA DE
    %% CLASIFICACIÓN UTILIZA UN CLASIFICADOR MÍNIMA DISTANCIA,
    %% PUEDE REQUERIRSE LA REPRESENTACIÓN DE LA FRONTERA DE SEPARACIÓN
    
    subplot(1,2,2) % A - D
    X = XTrain_A_D; Y = YTrain_A_D;
    nombres = nombres_A_D; coeficientes = coeficientes_A_D;
    funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
    XiOI = Xi(1, espacioCcas_A_D);
    hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
end

rmpath('Funciones')







