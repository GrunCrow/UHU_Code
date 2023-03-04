%% Práctica 2 - Sistemas de Percepción
%% Alba Márquez-Rodríguez

clc;
clear;

addpath("Practica2_InformacionImagenesBinarias");

%% Ejercicio 1
% Lee la imagen del fichero “ImagenBinaria.tif”. Comprueba que es una imagen binaria
% en la que están localizados los píxeles que integran los objetos que se muestran en la
% imagen.

img_name = 'ImagenBinaria.tif';

Imagen = imread(img_name);

% Imagen = double(Imagen/255);

imshow(Imagen);

unique(Imagen);

%% Ejercicio 2
% Genera una matriz binaria tipo double o logical donde: el valor 0 signifique píxel de
% fondo; el valor 1 signifique píxel de objeto.

% 0 = negro, 255 = blanco
Ib = Imagen == 255;

%% Ejercicio 3
% Genera una imagen en color, donde se visualice con un color diferente los objetos
% presentes en la imagen (al haber 6 objetos, pueden utilizarse los colores primarios y
% secundarios).

[Ietiq,N] = funcion_etiquetar(Ib);

% imtool(Ietiq)

% matriz de salida inicializada a 0
Io = uint8(zeros(size(Ietiq)));

% visualiza desde la etiqueta 1 a la N
for i=1:N
    % genera 3 valores enteros aleatorios que será el color de la X a
    % etiquetar
    color = [255*rand(),255*rand(),255*rand()];
    Io = Io + uint8(funcion_visualiza(Ib,Ietiq == i, color, false)); 
end

imtool(Io);


%% Ejercicio 4
% Genera una imagen donde se localicen, a través de su centroide, los objetos de mayor
% y menor área (ver documentación para la definición de área y centroide).

    areas = funcion_calcula_areas(Ietiq,N);

    centroides = funcion_calcula_centroides(Ietiq,N);

    [SortedAreas,pos] = sort(areas);
    areaMax = pos(end);
    areaMin = pos(1);

    % Muestra los centroides de los objetos con mayor y menor área
    imshow(Ietiq); hold on;
    plot(centroides(areaMin,1),centroides(areaMin,2),'.r'); % red = min
    plot(centroides(areaMax,1),centroides(areaMax,2),'.b'); % azul = max

    % Pinta las figuras con mayor y menor área.
    % funcion_visualiza(Ib,Ietiq == areaMax | Ietiq == areaMin, [0,255,255],true);

%% Ejercicio 5

% Genera una imagen binaria donde sólo se visualicen los dos objetos de área mayor.
% Para ello, se debe implementar la siguiente función:

IbFilt = funcion_filtra_objetos(Ib,SortedAreas(end-1));
imshow(IbFilt);
