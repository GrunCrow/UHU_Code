
clear all
clc

% tiempo de simulacion
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
    % ------------
    % Controlador
    %pause(0.5)
    % --------------
    
    x(i)=signal_v0(tiempo(i));
    
    % borra pantalla sin cerrar interfaz
    cla
    % para dibujar solo un circulo, meter la (i), si quita i dibuja todos
    % los circulos
    plot(tiempo(i),x(i),'o')
    hold on
    plot(t, y)
    drawnow
end
