clear, clc, close all

pathMain = "Parte 2/PruebaFinal/";
pathActual = pathMain + "02_FaseEntrenamiento_CASO3_knn_3clases/";

addpath(pathMain + 'Funciones')

%% Cargamos el espacio de características
nombreFichero = "espacioCcas_Circulo_Cuadrado_Triangulo.mat";
load(pathActual + "DatosGenerados/" + nombreFichero);
nombreFichero = 'nombresProblema.mat';
load(pathActual + "DatosGenerados/" + nombreFichero);

clear nombreFichero;

nombresProblema = [];
nombresProblema.descriptores = nombresProblemaOI.descriptores(espacioCcas);
nombresProblema.clases = nombresProblemaOI.clases;
nombresProblema.simbolos = nombresProblemaOI.simbolos;

%% Entrenamiento del clasificador k-NN
k = 5; % Número de vecinos
XTrain = XoI;
YTrain = YoI;

% YTest = funcion_knn(XTest, XTrain , YTrain, k);

save(pathActual + 'DatosGenerados/descriptores_atributos.mat','nombresProblema');
% save(pathActual + 'DatosGenerados/funcion_decision.mat','d');

save(pathActual + "DatosGenerados/espacioCcas_knn_Circulo_Cuadrado_Triangulo.mat","espacioCcas", 'XoI','YoI', 'nombresProblema')

rmpath(pathMain + 'Funciones')