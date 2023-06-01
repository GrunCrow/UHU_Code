%% Ejercicio 6

clear, clc, close all

pathArchivos = "Teoría/Datos/";

archivo = "datos_ejercicio6.mat";

load(pathArchivos + archivo);


% 1.- Utilizando el conjunto de datos de entrenamiento, 
% diseña un clasificador LDA y representa su hiperplano de separación.

unique(YTrain);

XTrain_clase1 = XTrain(YTrain == 1,:);
XTrain_clase2 = XTrain(YTrain == 2,:);

XTest_clase1 = XTrain(YTest == 1,:);
XTest_clase2 = XTrain(YTest == 2,:);

XTrain_total = [XTrain_clase1; XTrain_clase1];

% LDA: -1/2 * (X - muk)' * inv(M) * (X - muk) + log(pik)

balanceado = size(XTrain_clase1, 1) == size(XTrain_clase2, 1)

x1 = sym("x1", "real");
x2 = sym("x2", "real");
x3 = sym("x3", "real");

X = [x1; x2; x3];

mu1 = mean(XTrain_clase1)';
mu2 = mean(XTrain_clase2)';

pi1 = size(XTrain_clase1, 1) / size(XTrain_total, 1);
pi2 = size(XTrain_clase2, 1) / size(XTrain_total, 1);

parte1 = cov(XTrain_clase1) * size(XTrain_clase1, 1);
parte2 = cov(XTrain_clase2) * size(XTrain_clase2, 1);
div = size(XTrain_total, 1);
M = (parte1 + parte2) / div;

  

d1_lda = expand(-0.5 * (X - mu1)' * pinv(M) * (X - mu1) + log(pi1));
d2_lda = expand(-0.5 * (X - mu2)' * pinv(M) * (X - mu2) + log(pi2));

d12_lda = d1_lda - d2_lda;

x1 = 0; x2 = 0; x3 = 0; D = eval(d12_lda);
x1 = 1; x2 = 0; x3 = 0; A = eval(d12_lda) - D;
x1 = 0; x2 = 1; x3 = 0; B = eval(d12_lda) - D;
x1 = 0; x2 = 0; x3 = 1; C = eval(d12_lda) - D;

[x1Plano, x2Plano] = meshgrid(-4:4,-4:4);
x3Plano = -(A*x1Plano + B*x2Plano + D) / (C);

% Representar 

figure,
subplot(1,2,1)
plot3(XTrain_clase1(:,1), XTrain_clase1(:,2), XTrain_clase1(:,3), "*r"), hold on
plot3(XTrain_clase2(:,1), XTrain_clase2(:,2), XTrain_clase2(:,3), "*b"), hold on
surf(x1Plano, x2Plano, x3Plano)
subplot(1,2,2)
plot3(XTest_clase1(:,1), XTest_clase1(:,2), XTest_clase1(:,3), "*r"), hold on
plot3(XTest_clase2(:,1), XTest_clase2(:,2), XTest_clase2(:,3), "*b"), hold on
surf(x1Plano, x2Plano, x3Plano)

%% QDA

% Matrices covarianza

M1 = cov(XTrain_clase1);
M2 = cov(XTrain_clase2);

d1_qda = expand(-0.5 * (X - mu1)' * pinv(M) * (X - mu1) - log(det(M1)) + log(pi1));
d2_qda = expand(-0.5 * (X - mu2)' * pinv(M) * (X - mu2) - log(det(M2)) + log(pi2));

d12_qda = d1_qda - d2_qda;

%% Accuracy
x1 = XTest(:,1);
x2 = XTest(:,2);
x3 = XTest(:,3);

valores = eval(d12_lda);

Yp = zeros(size(YTest,1),1);
Yp(valores > 0) = 1;
Yp(valores < 0) = 2;

error = YTest - Yp;
nAciertos = sum(error == 0);
TasaAcierto_lda = nAciertos / size(YTest,1);


valores = eval(d12_qda);

Yp = zeros(size(YTest,1),1);
Yp(valores > 0) = 1;
Yp(valores < 0) = 2;

error = YTest - Yp;
nAciertos = sum(error == 0);
TasaAcierto_qda = nAciertos / size(YTest,1);