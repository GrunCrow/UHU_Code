
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulación del movimiento de un robot móvil
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

global l
global camino
global pose
global punto


camino=load('camino.dat');  %cargamos el camino

l=3.5; %distancia entre rudas delanteras y traseras, tambien definido en modelo
 
%Condiciones iniciales
pose0=[10; 40; pi/2];

t0=0;
tf=100;     %final de la simulación
h=0.1;      %paso de integracion
t=0:h:tf;   %vector tiempo
k=0;        %indice de la matriz

%inicialización valores iniciales
pose(:,k+1)=pose0;

t(k+1)=t0;

while (t0+h*k) < tf
%actualización
k=k+1;
    
%valores de los parámetros de control
volante=-0.1416;
velocidad=2;
conduccion=[velocidad volante];

%para representar el punto objetivo sobre la trayectoria
punto=[30 30];

%metodo de integración ruge-kuta

pose(:,k+1)=kuta_triciclo(t(k),pose(:,k),h,conduccion);

end




