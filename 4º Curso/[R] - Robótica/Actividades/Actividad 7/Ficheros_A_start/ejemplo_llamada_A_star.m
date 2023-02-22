%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejemplo de uso del algorithmo A* en un mapa definido por un bmp 
% 21-12-2015
%   fgb
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc
%Carga el fichero  BMP
MAPA = imread('.\cuadro4.bmp');

%Transformación para colocar correctamente el origen del Sistema de
%Referencia
MAPA(1:end,:,:)=MAPA(end:-1:1,:,:);

%Tamaño de las celdas del grid
delta=15;
%delta=35;
%delta=50;
%Llamada del algoritmo
Optimal_path=A_estrella(MAPA, delta);

%Dibujo de la ruta
plot(Optimal_path(:,1), Optimal_path(:,2))

