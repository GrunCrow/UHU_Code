
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulaci�n del movimiento de un robot m�vil
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
tf=100;     %final de la simulaci�n
h=0.1;      %paso de integracion
t=0:h:tf;   %vector tiempo
k=0;        %indice de la matriz

%inicializaci�n valores iniciales
pose(:,k+1)=pose0;

t(k+1)=t0;

while (t0+h*k) < tf
%actualizaci�n
k=k+1;
    
%valores de los par�metros de control
volante=-0.1416;
velocidad=2;
conduccion=[velocidad volante];

%para representar el punto objetivo sobre la trayectoria
punto=[30 30];

%metodo de integraci�n ruge-kuta

pose(:,k+1)=kuta_triciclo(t(k),pose(:,k),h,conduccion);

end




