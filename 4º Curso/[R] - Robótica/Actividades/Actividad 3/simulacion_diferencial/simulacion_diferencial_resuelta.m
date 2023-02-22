
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
tf=35;

%paso de integracion
h=0.1;
%vector tiempo
t=0:h:tf;
%indice de la matriz
k=0;

%inicialización valores iniciales
pose(:,k+1)=pose0;

t(k+1)=t0;

grid on

while (t0+h*k) < tf
    %actualización
    k=k+1;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %valores de los parámetros de control
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % para representar el punto objetivo sobre la trayectoria

    orden_minimo = minima_distancia(camino, [pose(1,k), pose(2,k)]);

    punto = [camino(orden_minimo+25,:)];
     
    % punto=camino(k,:);
    
    
    % k-1 porque nada más entramos en el bucle incrementamos el valor de k
    % Controlador de Alto Nivel
    delta = (pose(1, k)-punto(1))*sin(pose(3, k))-(pose(2, k)-punto(2))*cos(pose(3,k));
    Lh = sqrt((pose(1, k)-punto(1))^2 + (pose(2, k)-punto(2))^2);
    
    rho = (2*delta) / (Lh^2);

%     kv = 1;
%     velocidad = kv*Lh;
    velocidad = 10;

    if velocidad > 10
        velocidad = 10;
    elseif velocidad < -10
        velocidad = -10;
    end

    % modelo inverso

    velocidad_derecha=(velocidad/radio_rueda)*(1+l*rho);
    velocidad_izquierda=(velocidad/radio_rueda)*(1-l*rho);
     
    conduccion=[velocidad_derecha velocidad_izquierda];
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    %metodo de integración ruge-kuta
        
    pose(:,k+1)=kuta_diferencial(t(k),pose(:,k),h,conduccion);
        
end