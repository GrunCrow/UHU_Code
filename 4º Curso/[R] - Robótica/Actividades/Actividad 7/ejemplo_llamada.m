%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ejemplo de la llamada a la función 
% funcion_spline_cubica_varios_puntos.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
xc=[0 10 40 80 80 80];
yc=[0 0 40 40 100 120];



ds=3; %distancia entre puntos en cm.
camino=funcion_spline_cubica_varios_puntos(xc,yc,ds)';

 plot(camino(:,1),camino(:,2))  % ,'or','LineWidth',3
 hold on
 plot(xc,yc,'*g')