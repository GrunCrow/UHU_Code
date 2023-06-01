%% EJERCICIO 3

% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

%% Apartado 2.1.

% Recuperar path de las imágenes de calibración y el nombre del archivo
pathArchivos = "PruebaFinal_1/03_Ejercicio3_EliminacionOutiliers/";

addpath(pathArchivos)

nombreObjeto = "conjunto_de_datos_original.mat";

% Cargamos las imágenes de calibración
load(pathArchivos + nombreObjeto)


% % Representación de los datos.
% datosRGBColor = X(Y==1,:);
% datosRGBFondo = X(Y==0,:);
% 
% % representan los datos RGB de color y fondo en un gráfico 3D ('.r' para los datos de color y '.b' para los datos de fondo)
% plot3(datosRGBColor(:,1),datosRGBColor(:,2),datosRGBColor(:,3),'.r'), hold on;
% plot3(datosRGBFondo(:,1),datosRGBFondo(:,2),datosRGBFondo(:,3),'.b'), grid on;
% xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b');

posClaseInteres = 2;
[Xo,Yo] = funcion_detecta_outliers_clase_interes(X,Y,posClaseInteres);

% Se representa en un gráfico 3D los datos RGB del objeto y del fondo de la escena.
representa_datos_color_seguimiento(Xo, Yo)

% Se define la variable fichero con la ruta donde se va a guardar la matriz Xo y Yo.
fichero = 'conjunto_de_datos.mat';

% Se guarda la matriz Xo y Yo en el archivo XoYo_Color.mat.
save(pathArchivos+fichero, "Xo","Yo")