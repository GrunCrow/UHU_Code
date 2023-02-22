%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejemplo de visualización de un mapa bmp colocando correctamente el origen
% de coordenadas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc
%Carga el fichero  BMP

MAPA = imread('cuadro4.bmp');

%Transformación para colocar correctamente el origen del Sistema de
%Referencia
MAPA(1:end,:,:)=MAPA(end:-1:1,:,:);
image(MAPA);
axis xy

