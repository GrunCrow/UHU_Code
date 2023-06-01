%% EJERCICIO 4

% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

%% Apartado 4.1.

% Recuperar path de las imágenes de calibración y el nombre del archivo
pathArchivos = "PruebaFinal_1/04_Ejercicio4_DisegnoClasificador/";

addpath(pathArchivos)

nombreObjeto = "conjunto_de_datos.mat";

% Cargamos el conjunto de datos
load(pathArchivos + nombreObjeto)




% Se obtienen los valores únicos de Yo, se identifica la clase de interés y se seleccionan los valores de X correspondientes
valoresY = unique(Y);
% Selecciona los datos de la clase de interés (en este caso, la segunda clase)
FoI = Y == valoresY(2);
% Almacena los datos de la clase de interés en la matriz xClase
xClase = X(FoI,:);

% Se realiza la agrupación de los datos de la clase de interés utilizando k-means
numAgrup = 2; % Número de agrupaciones a realizar
% Aplica el algoritmo k-means a los datos de la clase de interés
[idx,centroides] = funcion_kmeans(xClase,numAgrup);

% Se calculan los datos de las esferas para cada grupo obtenido en la agrupación
% Inicializa la matriz para almacenar los datos de cada esfera
datosEsferas = zeros(numAgrup,6);
% Selecciona los datos de fondo (en este caso, la primera clase)
FoI = Y == valoresY(1);
xFondo = X(FoI,:);

% Calcula los datos de cada esfera
for i=1:numAgrup
    % Selecciona los datos correspondientes a la i-ésima agrupación
    xColor_i = xClase(idx==i,:);
    % Calcula los datos de la esfera correspondiente a la i-ésima agrupación
    [Rc,Gc,Bc,r1,r2,r12] = calcula_datos_esfera(xColor_i,xFondo);
    % Almacena los datos de la esfera i-ésima en la matriz datosEsferas
    datosEsferas(i,:) = [Rc,Gc,Bc,r1,r2,r12];
end


% Se representan los datos en el espacio RGB, la agrupación realizada y las esferas calculadas para cada grupo
for i=1:size(datosEsferas,1)
    % Selecciona los datos correspondientes a la i-ésima esfera
    datosEsfera_i = datosEsferas(i,:);
    % Obtiene los centroides y radios de la i-ésima esfera
    centroides_i = datosEsfera_i(:,1:3);
    radios_i = datosEsfera_i(:,4:6);
    % Representa los datos de color correspondientes a la clase de interés y fondo
    representa_datos_color_seguimiento_fondo(X,Y), hold on
    % Representa los datos de color de la i-ésima agrupación
    representa_datos_color_seguimiento_agrupacion(xClase,idx)
    % Representa la esfera correspondiente a la i-ésima agrupación
    hold on, representa_esfera(centroides_i, radios_i(1))
end

% Guardar los datos de las esferas detectadas en un archivo
save(pathArchivos + "datosMultiplesEsferas_clasificador.mat","datosEsferas");

% Eliminar la ruta de acceso a la carpeta "Funciones" de MATLAB
rmpath(pathArchivos);


% Pausar la ejecución para ver las figuras
pause

% Cerrar todas las figuras abiertas
close all

