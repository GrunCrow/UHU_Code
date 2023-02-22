
clear all;
clc

amplitud = 90;
periodo = 6;
delay = 2;

% variables de giro
x = 5;
y = 5;
theta = pi/4;
distancia = 0;
mapa = [];

tf = 2*periodo;
t=0:0.01:tf;
% y=signal_v2(t,periodo,delay,amplitud);

% plot(t,y), grid on
% punto = animatedline('Marker','o'); % La declaración se 
                                    % realiza después de hacer el plot
k=1;
tiempo(k)=0;
alfa(k) = signal_v2(tiempo,periodo,delay,amplitud);


tstart=tic;

while tiempo(k)<tf
    k=k+1;
    tiempo(k)=toc(tstart);
    tiempo(k)
    
    % referencia = x
    alfa(k) = signal_v2(tiempo(k),periodo,delay,amplitud);
    
    mapa_out=pinta_robot_v0(x,y,theta,alfa(k)*pi/180,distancia,mapa);

    drawnow;
    % Controlador
end

% close all
