%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Genera una spline cubica a partir de la especificación de varios puntos
% por los que ha de pasar (han de ser más de dos)
% el ángulo de salida y de llegada se calcula a partir de los dos primeros
% puntos y de los dos últimos
% Recibe: 
%   x: vector con las coordenadas x de los puntos de paso
%   y: vector con las coordenadas y de los puntos de paso
%   ds: distancia entre los puntos que definen la curva
% Devuelve:
%   curva : array de dos columna con las coordenadas x e y de los puntos que
%   definen la curva separados una distancia ds
% 7/12/2015 F Gomez Bravo
%------------------------------------------------------------------------
function curva=funcion_spline_cubica_varios_puntos(x,y,ds)


%------------------------
%Cálculo angulo de salida
thetai=atan2(y(2)-y(1),x(2)-x(1));
pix=cos(thetai);
piy=sin(thetai);
%Cálculo angulo de llegada
thetaf=atan2(y(end)-y(end-1),x(end)-x(end-1));
pfx=cos(thetaf);
pfy=sin(thetaf);
%---------------------------


%calcula distancia entre puntos
dt=sqrt((x(2:end)-x(1:end-1)).^2+(y(2:end)-y(1:end-1)).^2);

t=genera_tiempo(dt);

c = spline(t',[pix x pfx;piy y pfy]);

%--------------------------
%Calcula el vector tiempo
%------------------
%ds=1;
i=1;
tg(i)=t(1);

for j=1:2:2*(length(t)-1)

   
    while tg(i)<t(((j+1)/2)+1)
  
        i=i+1;

        %coeficientes correspondientes a dx
        cociente1=c.coefs(j,3)+(2*c.coefs(j,2)*(tg(i-1)-t(((j+1)/2))))+(3*c.coefs(j,1)*(tg(i-1)-t(((j+1)/2)))^2);

        %coeficientes correspondientes a dy
        cociente2=c.coefs(j+1,3)+(2*c.coefs(j+1,2)*(tg(i-1)-t(((j+1)/2))))+(3*c.coefs(j+1,1)*(tg(i-1)-t(((j+1)/2)))^2);
        
        dt=ds/sqrt(cociente1^2+cociente2^2);
        
        t_prox=tg(i-1)+dt;
        
        if t_prox>t(((j+1)/2)+1) %se sale del bucle si se sobrepasa el tiempo final de la sección de la curva
            i=i-1;
            break
        end
        
        tg(i)=t_prox;
        
        

    end
end
%----------------------------------------

curva=ppval(c,tg); %calculo de los puntos de la curva


end

function tiempo=genera_tiempo(dt)
m=length(dt);
tiempo(1)=0;
    for i=2:m+1
        tiempo(i)=tiempo(i-1)+dt(i-1);
    end
end
