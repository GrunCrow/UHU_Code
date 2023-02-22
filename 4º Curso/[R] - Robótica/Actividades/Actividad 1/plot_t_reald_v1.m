
clear all
clc

punto = animatedline('Marker','o');

t=0:0.01:4*pi;
y=signal_v0(t);

i=1;
tiempo(i)=0;
x(i)=signal_v0(tiempo);
tstart=tic;

while tiempo(i)<4*pi
    i=i+1;
    tiempo(i)=toc(tstart);
    tiempo(i)
    
    % Controlador
    % pause(0.5);
    
    
    referencia(i)=signal_v1(tiempo(i));
    
    addpoints(punto,tiempo(i),referencia)
    drawnow

    % para la animación
    cla
    
    plot(t,y), hold on
    % o = symbol, r = red
    plot(tiempo(i),referencia(i),'or')
    drawnow
end