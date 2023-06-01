%% EJERCICIO 1



%% Apartado a

% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

pathArchivos = "PruebaFinal_1/01_Ejercicio1/";

fichero = "imagen.jpg";
I = imread(pathArchivos + fichero);

addpath(pathArchivos)

% Umbrales del ejercicio
umbrales = [20 252 255];

% imshow(I);

% Calcular la media de los canales de intensidad
I_intensidad = uint8(mean(I,3));

% imshow(I_intensidad);

% Calcular matriz binaria que cumpla el requisito (Intensidad < umbral)
Ib_1 = I_intensidad < umbrales(1);
Ib_2 = I_intensidad < umbrales(2);
Ib_3 = I_intensidad < umbrales(3);

% Color
verde = [0,255,0];

% Calcular imagen con la matriz binaria correspondiente y marcan en verde
% los pixeles calculados
I_1 = funcion_visualiza(I_intensidad,Ib_1,verde,false);
I_2 = funcion_visualiza(I_intensidad,Ib_2,verde,false);
I_3 = funcion_visualiza(I_intensidad,Ib_3,verde,false);

% Mostrar imágenes
subplot(2,2,1), imshow(I);
title('Original')
subplot(2,2,2), imshow(I_1);
title('Umbral 20')
subplot(2,2,3), imshow(I_2);
title('Umbral 252')
subplot(2,2,4), imshow(I_3);
title('Umbral 255')



%% Apartado b

% Funcion etiquetar: Ietiq N
[Ietiq_1, N_1]   = funcion_bwlabel(Ib_1); % funcion etiquetar de matlab, vecindad por defecto?, para cambiar añadir param [Ietiq, N] = bwlabel(Ib, '4')
[Ietiq_2, N_2] = funcion_bwlabel(Ib_2);
[Ietiq_3, N_3] = funcion_bwlabel(Ib_3);

% estos son los centroides a mostrar de las posiciones de las 3 primeras de
% esos indices ordenados de mayor a menor
% Funcion calcula areas areas
% = calcula area, calcula centroide, hay q especificar porq sino da muchos
% descriptores
centroids_1 = funcion_regionprops_centroid(Ietiq_1, N_1);
areas_1 = funcion_regionprops_area(Ietiq_1, N_1);
centroids_2 = funcion_regionprops_centroid(Ietiq_2, N_2);
areas_2 = funcion_regionprops_area(Ietiq_2, N_2);
centroids_3 = funcion_regionprops_centroid(Ietiq_3, N_3);
areas_3 = funcion_regionprops_area(Ietiq_3, N_3);

% la clave es q cuando ordenemos nos quedemos con los indices
% Ordenar de mayor a menor las areas quedandote/generando con los indices
[~,pos_1] = max(cat(1,areas_1));
[~,pos_2] = max(cat(1,areas_2));
[~,pos_3] = max(cat(1,areas_3));

[~,sortedPosArea_1] = sort(cat(1,areas_1),'descend');
[~,sortedPosArea_2] = sort(cat(1,areas_2),'descend');
[~,sortedPosArea_3] = sort(cat(1,areas_3),'descend');

n_agrupaciones = 3;

% Asegurar que si hay menos centroides se cogen menos
if length(sortedPosArea_1) < n_agrupaciones
    sortedPosArea_1 = sortedPosArea_1(1:length(sortedPosArea_1));
else
    sortedPosArea_1 = sortedPosArea_1(1:n_agrupaciones);
end


if length(sortedPosArea_2) < n_agrupaciones
    sortedPosArea_2 = sortedPosArea_2(1:length(sortedPosArea_2));
else
    sortedPosArea_2 = sortedPosArea_2(1:n_agrupaciones);
end

if length(sortedPosArea_3) < n_agrupaciones
    sortedPosArea_3 = sortedPosArea_3(1:length(sortedPosArea_3));
else
    sortedPosArea_3 = sortedPosArea_3(1:n_agrupaciones);
end

% sortedPosArea_1 = sortedPosArea_1(1:n_agrupaciones);
% sortedPosArea_2 = sortedPosArea_2(1:n_agrupaciones);
% sortedPosArea_3 = sortedPosArea_3(1:n_agrupaciones);

IetiqAux_1 = zeros(size(Ietiq_1));
IetiqAux_2 = zeros(size(Ietiq_2));
IetiqAux_3 = zeros(size(Ietiq_3));

% if N>3     
% seleccionar el numPix = areas(5)
% para coger cada una de las 5 areas cogidas

n_agrupaciones_img_1 = n_agrupaciones;
n_agrupaciones_img_2 = n_agrupaciones;
n_agrupaciones_img_3 = n_agrupaciones;

if length(sortedPosArea_1) < n_agrupaciones
    n_agrupaciones_img_1 = length(sortedPosArea_1);
end

for i=1:n_agrupaciones_img_1
    IetiqAux_1 = IetiqAux_1 + (Ietiq_1 == sortedPosArea_1(i));
end

n_agrupaciones_img = n_agrupaciones;
if length(sortedPosArea_2) < n_agrupaciones
    n_agrupaciones_img_2 = length(sortedPosArea_2);
end

for i=1:n_agrupaciones_img_2
    IetiqAux_2 = IetiqAux_2 + (Ietiq_2 == sortedPosArea_2(i));
end

n_agrupaciones_img_3 = n_agrupaciones;
if length(sortedPosArea_3) < n_agrupaciones
    n_agrupaciones_img_3 = length(sortedPosArea_3);
end

for i=1:n_agrupaciones_img_3
    IetiqAux_3 = IetiqAux_3 + (Ietiq_3 == sortedPosArea_3(i));
end

% Funcion filtra objetos
    % Calcular el centroide 
x_1 = centroids_1(sortedPosArea_1(1:n_agrupaciones_img_1),1);
y_1 = centroids_1(sortedPosArea_1(1:n_agrupaciones_img_1),2);
x_2 = centroids_2(sortedPosArea_2(1:n_agrupaciones_img_2),1);
y_2 = centroids_2(sortedPosArea_2(1:n_agrupaciones_img_2),2);
x_3 = centroids_3(sortedPosArea_3(1:n_agrupaciones_img_3),1);
y_3 = centroids_3(sortedPosArea_3(1:n_agrupaciones_img_3),2);

Iaux_1 = funcion_visualiza(I_intensidad,IetiqAux_1,verde,false);
Iaux_2 = funcion_visualiza(I_intensidad,IetiqAux_2,verde,false);
Iaux_3 = funcion_visualiza(I_intensidad,IetiqAux_3,verde,false);

subplot(2,2,2), imshow(I_1);
title('Umbral 20')
plot(x_1(2:n_agrupaciones_img_1),y_1(2:n_agrupaciones_img_1),'*r');
plot(x_1(1),y_1(1),'*b');

subplot(2,2,3), imshow(I_2);
title('Umbral 252')
plot(x_2(2:n_agrupaciones_img_2),y_2(2:n_agrupaciones_img_2),'*r');
plot(x_2(1),y_2(1),'*b');

subplot(2,2,4), imshow(I_3);
title('Umbral 255')
plot(x_3(2:n_agrupaciones_img_3),y_3(2:n_agrupaciones_img_3),'*r');
plot(x_3(1),y_3(1),'*b');

subplot(2,2,1), imshow(I), hold on;
title('Imagen Original')
% plot(x_1(2:n_agrupaciones_img),y_1(2:n_agrupaciones_img),'*r');
% plot(x_1(1),y_1(1),'*b');





% Funcion etiquetar: Ietiq N
[Ietiq_70, N_70]   = bwlabel(Ib_1); % funcion etiquetar de matlab, vecindad por defecto?, para cambiar añadir param [Ietiq, N] = bwlabel(Ib, '4')
[Ietiq_140, N_140] = bwlabel(Ib_2);
[Ietiq_210, N_210] = bwlabel(Ib_3);

% matriz de salida inicializada a 0
Io_70 = uint8(zeros(size(Ietiq_70)));
Io_140 = uint8(zeros(size(Ietiq_140)));
Io_210 = uint8(zeros(size(Ietiq_210)));

% visualiza desde la etiqueta 1 a la N
for i=1:5
    % genera 3 valores enteros aleatorios que será el color de la X a
    % etiquetar
    color = [255*rand(),255*rand(),255*rand()];
    Io_70 = Io_70 + uint8(funcion_visualiza(Ib_1,Ietiq_70 == i, color, false)); 
    Io_140 = Io_140 + uint8(funcion_visualiza(Ib_2,Ietiq_140 == i, color, false));
    Io_210 = Io_210 + uint8(funcion_visualiza(Ib_3,Ietiq_210 == i, color, false));
end

subplot(2,2,2), imshow(Io_70), hold on;
title('Umbral 70')
subplot(2,2,3), imshow(Io_140), hold on;
title('Umbral 140')
subplot(2,2,4), imshow(Io_210), hold on;
title('Umbral 210')
subplot(2,2,1), imshow(I), hold on;
title('Imagen Original')
plot(x_1(2:5),y_1(2:5),'*r');
% Centroide de la agrupación mayor
plot(x_1(1),y_1(1),'*b');

rmpath(pathArchivos)
