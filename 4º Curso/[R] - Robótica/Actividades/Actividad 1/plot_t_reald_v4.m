
clear
clc

amplitud = 90;
Periodo = 6;
delay = 2
tf = 2*Periodo;
t=0:0.01:tf;
y=signal_v2(t,Periodo,delay,amplitud);

plot(t,y), grid on
punto = animatedline('Marker','o'); % La declaración se 
                                    % realiza después de hacer el plot
k=1;
tiempo(k)=0;
referencia(k) = signal_v1(tiempo,Periodo,delay,amplitud);
tstart=tic;

while tiempo(k)<tf
    k=k+1;
    tiempo(k)=toc(tstart);
    tiempo(k)
    
    % referencia = x
    referencia(k) = signal_v1(tiempo(k),Periodo,delay,amplitud);
    %cla
    %plot(t,y)
    %hold on
    %plot(tiempo(k),referenia(k),'or')
    clearpoints(punto);
    addpoints(punto,tiempo(k),referencia(k));

    drawnow
    % Controlador


end

% close all
