clear, clc, close all

pathMain = "Parte 2/PruebaFinal/";
pathAnterior = pathMain + "02_FaseEntrenamiento_CASO3_knn_3clases/";

addpath(pathMain + 'Funciones')

%% Cargamos el espacio de características
nombreFichero = "espacioCcasCCT.mat";
load(pathMain + "DatosGenerados/" + nombreFichero);
nombreFichero = 'nombresProblema.mat';
load(pathMain + "DatosGenerados/" + nombreFichero);

clear nombreFichero;

nombreImagen = pathMain + "Imagenes/Test1.jpg";

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
ruta = pathMain + "DatosGenerados/";
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

% Circulo Cuadrado Triangulo

ruta = pathAnterior; 
nombreArchivo = "DatosGenerados/espacioCcas_Circulo_Cuadrado_Triangulo.mat";
load(ruta + nombreArchivo);

espacioCcasCircCuadTrian = espacioCcas;
XTrainCircCuadTrian = XoI;
YTrainCircCuadTrian = YoI;
nombresCircCuadTrian = nombresProblema;

%% EVALUAMOS CLASIFICADORES PARA CADA OBJETO

k = 5;
tipoDistancia = "Euclidea";
codifClases = unique(YTrainCircCuadTrian);
color = [0 255 0];

XoI = XImagenS(:, espacioCcasCircCuadTrian);

YoI = funcion_knn(XoI, XTrainCircCuadTrian, YTrainCircCuadTrian, k, tipoDistancia);

%% 5.- APLICACIÓN DE CLASIFICADORES PARA EL RECONOCIMIENTO DE CADA OBJETO

for i=1:numObjetos
    YiOI = YoI(i);

    posClaseOI = find(ismember(codifClases, YiOI));

    claseOI = nombresCircCuadTrian.clases{posClaseOI};
    reconocimiento = ["Reconocimiento objeto: " claseOI];

    Ib = Ietiq == i;
    
    %% 6.- VISUALIZACIÓN DE RESULTADOS:
    % 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
    % DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO

    figure,
    funcion_visualiza(I, Ib, color, true);
    title(reconocimiento)

end

rmpath(pathMain + 'Funciones')

