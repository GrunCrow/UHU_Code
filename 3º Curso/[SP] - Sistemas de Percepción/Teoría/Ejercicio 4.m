% Para realizar un sistema diagnóstico de una determinada enfermedad, 
% se han obtenido datos de 5 biomarcadores diferentes sobre personas 
% sanas y personas afectadas por la enfermedad. Para ello se han realizado 
% 2 experimentos, el primero con los dos primeros biomarcadores y el segundo 
% con los tres restantes. Los resultados de estos experimentos se facilitan 
% en el archivo comprimido datos_ejercicio4.zip

clc, clear, close all

pathArchivos = "Teoría/Datos/datos_ejercicio4/"

%% Representa para cada experimento los datos de los diferentes biomarcadores, 
% distinguiendo en la representación aquellas muestras que se corresponden a 
% personas sanas de aquellas tomadas a personas afectadas por la enfermedad.

% Carga de datos 1
load(pathArchivos + "datos_biomarcadores_exp1.mat")

E1_clase1 = datos((clases == 1),:)
E1_clase2 = datos((clases == 2),:)

datos_E1 = [E1_clase1; E1_clase2]

% Representar
plot(E1_clase1(:,1),E1_clase1(:,2),'*b'), hold on
plot(E1_clase2(:,1),E1_clase2(:,2), '*r'), grid on

% Carga de datos 2
load(pathArchivos + "datos_biomarcadores_exp2.mat")

E2_clase1 = datos((clases == 1),:)
E2_clase2 = datos((clases == 2),:)

datos_E2 = [E2_clase1; E2_clase2]

% Representar
figure, plot3(E2_clase1(:,1),E2_clase1(:,2), E2_clase1(:,3),'*b'), hold on
plot3(E2_clase2(:,1),E2_clase2(:,2), E2_clase2(:,3), '*r'), grid on


%% Clasificador LDA
% Diseña un clasificador LDA que permita predecir la enfermedad en un 
% paciente a partir de los biomarcadores utilizados en los experimentos 
% 1 y 2. Evalúa la tasa de acierto del clasificador en el conjunto de 
% muestras disponibles de cada experimento

% LDA = -1/2(x-mu)'* inv(E) * x(mu) * log(pik)
% Datos equiprobables
% LDA = -(x-mu)'* inv(E) * x(mu)

m11 = mean(E1_clase1)'
m12 = mean(E1_clase2)'

m21 = mean(E2_clase1)'
m22 = mean(E2_clase2)'

x1 = sym('x1', 'real')
x2 = sym('x2', 'real')
x3 = sym('x3', 'real')

X_1 = [x1; x2]
X_2 = [x1; x2; x3]

% M_cov = cov(datos_E1) / size(datos_E1,1)

mat1 = (size(E1_clase1,1)*cov(E1_clase1))
mat2 = (size(E1_clase2,1)*cov(E1_clase2))
div = (size(datos_E1,1))
M_cov =  mat1 + mat2 / div;

M_covi = pinv(M_cov)

d1_E1 = expand(-((X_1 - m11)' * M_covi * (X_1 -m11)))
d2_E1 = expand(-((X_1 - m12)' * M_covi * (X_1 - m12)))

d12_E1 = d1_E1 - d2_E1

% Cálculo de la frontera
x1 = -2;
x2 = sym('x2','real');
x2 = solve(eval(d12_E1) == 0);

punto1 = [x1 x2];

x1 = 2;
x2 = sym('x2','real');
x2 = solve(eval(d12_E1) == 0);

punto2 = [x1 x2];

% Representa los datos Experimento 1:
plot(E1_clase1(:,1),E1_clase1(:,2), '*r'), hold on
plot(E1_clase2(:,1),E1_clase2(:,2), '*b'), hold on
plot([punto1(1,1), punto2(1,1)],[punto1(1,2), punto2(1,2)]), grid on

% Tasa de acierto

x11 = datos_E1(:,1);
x12 = datos_E1(:,2);
valores = eval(d12_E1);
valores(valores>0) = 1; valores(valores<0) = 2;

error = valores - clases;
numAciertos = sum(error == 0);
tasaAcierto = numAciertos/size(datos_E1,1);

% Exp 2

mat1 = (size(E2_clase1,1)*cov(E2_clase1))
mat2 = (size(E2_clase2,1)*cov(E2_clase2))
div = (size(datos_E2,1))
M_cov =  mat1 + mat2 / div;

M_covi = pinv(M_cov)

d1_E2 = expand(-((X_2 - m21)' * M_covi * (X_2 -m21)))
d2_E2 = expand(-((X_2 - m22)' * M_covi * (X_2 - m22)))

d12_E2 = d1_E2 - d2_E2

% Cálculo de la frontera
% x1 = 0;
% x2 = 0;
% x3 = sym('x3','real');
% x3 = solve(eval(d12_E2) == 0);
% 
% punto1 = [x1 x2 x3];
% 
% x1 = 0;
% x3 = 0;
% x2 = sym('x2','real');
% x2 = solve(eval(d12_E2) == 0);
% Ax21 + Bx22 + Cx23 + D == 0
x1 = 0; x2 = 0; x3 = 0; D = eval(d12_E2);
x1 = 0; x2 = 0; x3 = 1; C = eval(d12_E2)-D;
x1 = 0; x2 = 1; x3 = 0; B = eval(d12_E2)-D;
x1 = 1; x2 = 0; x3 = 0; A = eval(d12_E2)-D;

[x1Plano, x2Plano] = meshgrid(-2:2,-2:2);
x3Plano = -(A*x1Plano + B*x2Plano + D) / (C + eps);

% Representa los datos Experimento 1:
figure, plot3(E2_clase1(:,1),E2_clase1(:,2), E2_clase1(:,3), '*r'), hold on
plot3(E2_clase2(:,1),E2_clase2(:,2), E2_clase2(:,3), '*b'), hold on
surf(x1Plano, x2Plano, x3Plano)

% Tasa de acierto
x1 = datosE2_Total(:,1);
x2 = datosE2_Total(:,2);
x3 = datosE2_Total(:,3);
valores = eval(d12);
valores(valores>0) = 1; valores(valores<0) = 2;

error = valores - clases;
numAciertos = sum(error == 0);
tasaAcierto = numAciertos/size(datosE2_Total,1);