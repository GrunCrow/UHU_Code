
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulación del movimiento de un robot móvil
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

j=1;

global l
global radio_rueda
global camino
global pose
global punto
%cargamos el camino

camino=load('camino.dat');

l=3.5; %distancia entre rudas delanteras y traseras, tambien definido en modelo
radio_rueda=1;

%Condiciones iniciales 
pose0=[0; 0; 0];

t0=0;

%final de la simulación
tf=15;

%paso de integracion
h=0.1;
%vector tiempo
t=0:h:tf;
%indice de la matriz
k=0;

%inicialización valores iniciales
pose(:,k+1)=pose0;

t(k+1)=t0;

while (t0+h*k) < tf,
    %actualización
    k=k+1;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %valores de los parámetros de control
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
velocidad_derecha=2.1;
velocidad_izquierda=1.5;

R=10;
 
 rho=1/R;
 
 Velocidad_lineal = 10;

 velocidad_derecha=(Velocidad_lineal/radio_rueda)*(1+l*rho);
 velocidad_izquierda=(Velocidad_lineal/radio_rueda)*(1-l*rho);
 
 phi=atan(rho*l);
 
 volante=-0.1416;
 
 volante=phi;
 
 velocidad=2;


 
 conduccion=[velocidad_derecha velocidad_izquierda];
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %para representar el punto onjetivo sobre la trayectoria
 
 punto=[30 30];

    
%metodo de integración ruge-kuta

pose(:,k+1)=kuta_diferencial(t(k),pose(:,k),h,conduccion);

end




