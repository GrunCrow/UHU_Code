%% Método de OTSU

clear, clc, clear all

addpath("Funciones")
addpath("Imagenes")

I = imread("Matric.tif");
imshow(I), figure, imhist(I);

g_otsu = funcion_otsu(I);
255*graytresh(I);


%% Función OTSU para 2 umbrales

I = imread(Matric.tif);

close all;

figure, imshow(I), figure, imhist(I);
g_otsu = funcion_otsu(I);
figure, funcion_visualiza(uint8(I), )


[g1, g2] = funcion_otsu