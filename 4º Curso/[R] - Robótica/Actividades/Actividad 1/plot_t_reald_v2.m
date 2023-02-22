% V1 MÁS EFICIENTE

clear all
clc

periodo = 4
tf=2*periodo

t=0:0.01:4*pi;
y=signal_v0(t);
% error que pasaba, pusimos plot despues de punto y daba error, hay que
% ponerlo antes de definir el punto
plot(t,y);

punto = animatedline('Marker','o');

k=1;
tiempo(k)=0;
x(k)=signal_v0(tiempo);
tstart=tic;

while tiempo(k)<tf
    k=k+1;
    tiempo(k)=toc(tstart);
    tiempo(k);
    
    % Controlador
    % pause(0.5);
    
    
    referencia(k)=signal_v0(tiempo(k), periodo);
    punto
    clearpoints(punto)
    addpoints(punto,tiempo(k),referencia(k));
    drawnow;

    
end