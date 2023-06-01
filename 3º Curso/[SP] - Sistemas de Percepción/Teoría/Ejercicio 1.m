%% Ejercicio 2

% A partir de los datos de la tabla, construir un Clasificador de Mínima Distancia Euclídea

clase1 = [ 1 2 2 2 2 3 3 4 5 1;
       3 1 2 3 4 2 3 3 2 2];

clase2 = [ 4 5 5 4 6 6 6 7 4 8;
       5 5 6 7 5 6 7 6 6 7];

x1 = sym('x1','real');
x2 = sym('x2','real');
x = [x1;x2];

mu1 = mean(clase1')';
mu2 = mean(clase2')';



d1 = expand((x - mu1)' * (x - mu1))

d2 = expand((x - mu2)' * (x - mu2))

d12 = d1 - d2

p = 0;

p1 = [0 (-7*p + 215/4)/6];

p2 = [(215/4 - 6*p)/7 0];

% Reemplazar x1 por 0
% f(x1, x2) = d12;
% 
% p2 = fzero(f, 0)

% Representación de los datos:
plot(clase1(1,:),clase1(2,:),'*b'), hold on
plot(clase2(1,:),clase2(2,:), '*r'), hold on
plot(p1,p2) % Representa la línea dada por los puntos 
axis([0,10,0,10])