clear, clc, close all

pathActual = "04_FaseTest/";

addpath('Funciones')

nombreImagen = "Imagenes/Test/Test.png";

%% GENERACION DE DATOS DE LA IMAGEN

I = imread(nombreImagen);

umbral = graythresh(I); % Obtiene umbral de rango 0-1

Ibin = I > 255*umbral;

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
ruta = "01_GeneracionDatos/DatosGenerados/";
nombreArchivo = "datos_estandarizados.mat";
load(ruta + nombreArchivo);

numObjetos = N;
numDescriptores = size(XImagen, 2);

XImagenS = XImagen;

for i = 1:numDescriptores
    XImagenS(:, i) = (XImagen(:,i)-medias(i))/(desviaciones(i)+eps); 
end

%% 4.- CARGAR INFORMACIÓN PARA LA APLICACIÓN DE LOS CLASIFICADORES
%% A UTILIZAR SEGÚN LA ESTRATEGIA DE CLASIFICACIÓN DISEÑADA

% Cargar Informacion numeuler - 1234567-8

nombreArchivo = "01_GeneracionDatos/DatosGenerados/ConjuntoDatosXY";
load(nombreArchivo);
nombreArchivo = "01_GeneracionDatos/DatosGenerados/nombresProblema";
load(nombreArchivo);

YTrain_1234567_8 = Y;
nombres_1234567_8 = nombresProblema;

[Ietiq,N] = bwlabel(IbinFilt);

stats = regionprops(Ietiq,'EulerNumber');
XImagen = zeros(N,1);
XImagen = cat(1,stats.EulerNumber);
XTrain_1234567_8 = XImagen;


% Cargar Informacion QDA - 17_23456

nombreArchivo = "02_QDA/DatosGenerados/espacioCcas_QDA.mat";
load(nombreArchivo); 

espacioCcas_17_23456 = espacioCcas;
XTrain_17_23456 = XoI;
YTrain_17_23456 = YoI;
nombres_17_23456 = nombresProblemaOI;


% Cargar Informacion LDA - 1_7

nombreArchivo = "03_LDA/DatosGenerados/espacioCcas_LDA.mat";
load(nombreArchivo);

d12_1_7 = d12;
coeficientes_1_7 = coeficientes_d12;
espacioCcas_1_7 = espacioCcas;
XTrain_1_7 = XoI;
YTrain_1_7 = YoI;
nombres_1_7 = nombresProblemaOI;

%% EVALUAMOS CLASIFICADORES PARA CADA OBJETO

% Aplicar KNN

k = 5;
tipoDistancia = "Euclidea";
codifClases = unique(YTrain_1234567_8);

XoI = XImagenS(:, espacioCcas_1234567_8);

YoI = funcion_knn(XoI, XTrain_1234567_8, YTrain_1234567_8, k, tipoDistancia);


%% 5.- APLICACIÓN DE CLASIFICADORES PARA EL RECONOCIMIENTO DE CADA OBJETO

for i=1:numObjetos
    YiOI = YoI(i);

    posClaseOI = find(ismember(codifClases, YiOI)); % 1 = 1234567, 2 = 8

    Xi = XImagenS(i,:);

    if posClaseOI == 8 % 8
        claseOI = nombres_1234567_8.clases{posClaseOI};
        reconocimiento = ["Reconocimiento objeto: " claseOI];
        color = [255 0 0];

        Ib = Ietiq == i;
    
        %% 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
        %% DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO
    
        figure,
        funcion_visualiza(I, Ib, color, true);
        title(reconocimiento)
    else %posClaseOI == 1 % 1234567
        % Clasificador 17 - 23456
        XTest = XImagenS(:, espacioCcas_17_23456);
        codifClases_17_23456 = unique(YTrain_17_23456);
        [Yp, d] = funcion_aplica_QDA(XTest, vectorMedias, matricesCovarianzas, probabilidadPriori, codifClases_17_23456);
        % Yp = prediccion de Y, tenemos la codificacion
        posClaseOI = find(ismember(codifClases_17_23456, Yp));
        % posClaseOI = find(ismember(codifClases_C_E_F_G, YiOI));
        claseOI = nombres_17_23456.clases{posClaseOI};
        if posClaseOI ~= 1
            reconocimiento = ["Reconocimiento objeto: " claseOI];
            color = [0 0 255];

            Ib = Ietiq == i;
        
            figure,
            funcion_visualiza(I, Ib, color, true);
            title(reconocimiento)
        else % == 1 -> 1_7
            XiOI = Xi(1, espacioCcas_1_7);
            X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
            valor_d12_1_7 = eval(d12_1_7);
            if valor_d12_1_7>0  % 1
                claseOI = nombres_1_7.clases{1};
                reconocimiento = {"Reconocimiento Objeto: " claseOI};
                color = [0 0 255];
            else
                claseOI = nombres_1_7.clases{2};
                reconocimiento = {"Reconocimiento Objeto: " claseOI};
                color = [0 0 255];
            end

            Ib = Ietiq == i;
    
            %% 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
            %% DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO
        
            figure,
            subplot(1,2,1), funcion_visualiza(I, Ib, color, true);
            title(reconocimiento)
    
            subplot(1,2,2) % A - D
            funcion_representa_datos_dato(XTrain_1_7, YTrain_1_7, espacioCcas_1_7, nombresProblema_1_7, Xi)  
        end

    end

    

    %% 6.2.- En el caso de tratar con espacios de características de dos o tres dimensiones, REPRESENTACIÓN DE LA INSTANCIA DE TEST, JUNTO CON LAS %% DE TRAIN EN EL ESPACIO DE CARACTERÍSTICAS UTILIZADO. SI LA TÉCNICA DE
    %% CLASIFICACIÓN UTILIZA UN CLASIFICADOR MÍNIMA DISTANCIA,
    %% PUEDE REQUERIRSE LA REPRESENTACIÓN DE LA FRONTERA DE SEPARACIÓN

%     Ventana donde se representen los valores de los descriptores del 
% conjunto de entrenamiento utilizados para reconocer el objeto y los del 
% objeto en cuestión (sólo cuando la clase del objeto a analizar NO sea 
% Letra B). Cuando la dimensión sea superior a 3, el espacio de 
% características de la representación estará definido por los 3 primeros 
% descriptores.
    
%     subplot(1,2,2) % A - D
%     X = XTrain_ACD_EFG; Y = YTrain_ACD_EFG;
%     coeficientes = coeficientes_ACD_EFG;
%     nombres = nombres_ACD_EFG; 
%     nombreClases{1}='ACD'; % 1
%     nombreClases{2} = 'EFG'; % 2
%     nombres.clases = nombreClases;
%     funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
%     XiOI = Xi(1, espacioCcas_ACD_EFG);
%     hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
end

rmpath('Funciones')
