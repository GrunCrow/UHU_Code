%% Ejercicio 2

% Diseñar un Clasificador LDA suponiendo que se disponen de datos 
% balanceados de 3 clases, cada uno de ellos representados por 2 características

x1 = sym('x1', 'real');
x2 = sym('x2', 'real');

X = [x1;x2];

m1 = [0;3];
m2 = [5;2];
m3 = [1;0];

COV = sym([1/2 0; 0 1/4])
COVI = inv(COV)

d1 = expand(sym(-(X - m1)'*COVI*(X - m1)))
d2 = expand(sym(-(X - m2)'*COVI*(X - m2)))
d3 = expand(sym(-(X - m3)'*COVI*(X - m3)))

d12 = d1 - d2
d13 = d1 - d3
d23 = d2 - d3