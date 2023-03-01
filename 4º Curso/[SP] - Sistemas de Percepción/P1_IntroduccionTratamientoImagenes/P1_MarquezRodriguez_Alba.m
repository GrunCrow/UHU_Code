%% Práctica 1 - Sistemas de Percepción
%% Alba Márquez-Rodríguez

clc;
clear;

addpath("P1_IntroduccionTratamientoImagenes");

%% Ejercicio 1
% Con la instrucción imfinfo de Matlab obtén la siguiente información de 
% la imagen “P1_1.jpg”: anchura en píxeles, altura en píxeles, 
% tipo de imagen y profundidad de bit

img_name = 'P1_1.jpg';

img_info = imfinfo(img_name);

% ans = 
% 
%   struct with fields:
% 
%            Filename: 'C:\Users\albam\OneDrive - UNIVERSIDAD DE HUELVA\2. Universidad\4º Curso\2. 2º Cuatrimestre\Sistemas de Percepción\Prácticas\P1_IntroduccionTratamientoImagenes\P1_1.jpg'
%         FileModDate: '06-Feb-2023 13:11:38'
%            FileSize: 14940
%              Format: 'jpg'
%       FormatVersion: ''
%               Width: 500
%              Height: 338
%            BitDepth: 24
%           ColorType: 'truecolor'
%     FormatSignature: ''
%     NumberOfSamples: 3
%        CodingMethod: 'Huffman'
%       CodingProcess: 'Progressive'
%             Comment: {'LEAD Technologies Inc. V1.01'}


% anchura en píxeles = Width: 500
% altura en píxeles = Height: 338
% tipo de imagen = ColorType: 'truecolor'
% profundidad de bit = BitDepth: 24

image_height = img_info.Height;
image_width = img_info.Width;
image_bitDepth = img_info.BitDepth;
image_color = logical([]);

%% Ejercicio 2
% Lee la imagen y guárdala en una variable de Matlab de nombre Imagen1.

Imagen1 = imread(img_name);

%% Ejercicio 3
% Visualiza esta imagen con la instrucción imtool y con la instrucción imshow. 
% Familiarízate con los entornos gráficos de salida de cada una de estas instrucciones.

imtool(Imagen1);

imshow(Imagen1);

%% Ejercicio 4
% Con la instrucción whos obtén la siguiente información de la variable 
% Matlab Imagen1: tipo de dato y rango

% whos Imagen1;
% 
%   Name           Size                Bytes  Class    Attributes
% 
%   Imagen1      338x500x3            507000  uint8 

% Tipo de dato = Class = uint8
% Rango = Size = 338x500x3 


%% Ejercicio 5
% Utilizando la instrucción max, calcula el valor máximo de la variable Imagen1 
% (máximo nivel de intensidad).

max(max(Imagen1))

% ans(:,:,3) =
% 
%    255

%% Ejercicio 6
% Calcula en Matlab la imagen complementaria de Imagen1, denominándola Imagen2. 
% Visualiza esta imagen y guárdala en un fichero de imagen del mismo formato 
% que la imagen original empleando la instrucción imwrite.

Imagen2 = 255 - Imagen1;
imshow(Imagen2);
imwrite(Imagen2, "P1_IntroduccionTratamientoImagenes/P1_2.jpg");

% cambiando canal a canal
ImagenR = 255 - Imagen1(:,:,1);
ImagenG = 255 - Imagen1(:,:,2);
ImagenB = 255 - Imagen1(:,:,3);

ImagenSalida = [ImagenR,ImagenG,ImagenB];

imagenFinal(:,:,1) = ImagenR;
imagenFinal(:,:,2) = ImagenG;
imagenFinal(:,:,3) = ImagenB;

% o

imagenFinal = cat(3, ImagenR, ImagenG, ImagenB);

imshow(imagenFinal);

%% Ejercicio 7
% Crea y visualiza una matriz, de nombre Imagen3, con los niveles de rojo de 
% la imagen Imagen1. Notar que esta nueva matriz es una imagen en niveles de gris.

Imagen3 = Imagen1(:,:,1); % RGB -> cogemos solo canal 1 que es el rojo
imshow(Imagen3)


%% Ejercicio 8
% Utiliza la función imadjust con la configuración 
% ImagenSalida=imadjust(ImagenEntrada,[],[],gamma) para, 
% mediante la modificación del parámetro gamma, obtener una imagen 
% Imagen4 más clara (asignar gamma=0.5) y una imagen Imagen5 más oscura 
% (asignar gamma=1.5)que Imagen3.

% Visualiza estas imágenes y representa su histograma mediante la función Matlab 
% imhist. Interpreta cualitativamente los resultados de la operación realizada

gamma = 0.5;
imagen4 = imadjust(Imagen1,[],[],gamma);
gamma = 1.5;
imagen5 = imadjust(Imagen1,[],[],gamma);
ImagenSalida = [imagen4,imagen5];

imshow(ImagenSalida);

imhist(ImagenSalida);
% hay valores más bajos, estos son los que pertenecen a un menor valor de
% gamma, y valores mayores que pertenecen a un gamma mayor

imhist(imagen4);

%% Ejercicio 9
% Utiliza la función imabsdiff, para crear una nueva imagen Imagen6 que 
% refleje la diferencia absoluta de Imagen4 e Imagen5. Interpreta los resultados. 
% Realiza la misma operación sin utilizar la función imabsdiff y comprueba que 
% obtienes los mismos resultados.

% Para ello, implementa y utiliza la siguiente función que permite saber si 
% el contenido de dos matrices de la misma dimensión es el mismo:

% varLogica = funcion_compara_matrices(M1, M2)

% donde varLogica es una variable lógica indica si M1 y M2 son iguales 
% (valor true) o diferentes (valor false)

imagen6 = imabsdiff(imagen4,imagen5);
imshow(imagen6);

imagen_diff = funcion_imabsdiff(imagen4,imagen5);
imshow(imagen_diff);

% porque imagen 4 tiene mayores valores al teneer un menor gamma (imagen
% más "blanca" va primero y se le resta los valores de img5

% imagen_ml = abs(imagen4 - imagen5);
% imshow(imagen_ml);

funcion_compara_matrices(imagen_ml,imagen6);

%% Ejercicio 10
% Implementación de histograma de una imagen:
% 
% a. Implementa una función que tenga como objetivo calcular el histograma de 
% una imagen de intensidad I. La función debe devolver un vector h con la 
% información numérica del histograma.
% 
% h = función_histograma(I)
% 
% Deben implementarse dos versiones de la función: la primera, 
% que realiza un recorrido por cada píxel de la imagen para generar el histograma; 
% la segunda, que realiza un recorrido por cada posible nivel de gris que puede 
% estar presente en la imagen de entrada.
% 
% 
% b. Aplica la función anterior para generar y visualizar el histograma de la 
% componente verde de la imagen de la práctica.
% 
% 
% c. Comprueba que obtienes los mismos resultados que genera la función Matlab imhist. 
% La comprobación debe realizarse visualmente, representando los histogramas en una 
% misma gráfica, y numéricamente, utilizando la función funcion_compara_matrices.

img = Imagen1;

G = img(:,:,2); % RGB, verde = G = 2
figure, imhist(G);
h = imhist(G);

v1 = funcion_histograma(G);
v2 =  funcion_histograma_gris(G);

% valores_posibles = 0:255;
hist = stem(valores_posibles, v1, '.r'), hold on, imhist(G);

figure,
subplot(1,3,1), plot(h)
subplot(1,3,2), plot(v1)
subplot(1,3,3), plot(v2)

figure,
subplot(1,3,1), stem(valores_posibles, h, '.r'), hold on, imhist(G)
subplot(1,3,2), stem(valores_posibles, v1, '.r'), hold on, imhist(G)
subplot(1,3,3), stem(valores_posibles, v2, '.r'), hold on, imhist(G)

funcion_compara_matrices(v1,h);
funcion_compara_matrices(v2,h);