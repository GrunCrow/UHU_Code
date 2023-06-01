clear, clc, close all

pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath('Funciones')

%% Cargamos el espacio de características
nombreFichero = "espacioCcas_AD_B_CEFG.mat";
load(pathActual + "DatosGenerados/" + nombreFichero);
nombreFichero = 'nombresProblema_knn.mat';
load(pathActual + "DatosGenerados/" + nombreFichero);

clear nombreFichero;

nombresProblema = [];
nombresProblema.descriptores = nombresProblemaOI.descriptores(espacioCcas);
nombresProblema.clases = nombresProblemaOI.clases;
nombresProblema.simbolos = nombresProblemaOI.simbolos;

%% Entrenamiento del clasificador k-NN
XTrain = XoI;
YTrain = YoI;

% YTest = funcion_knn(XTest, XTrain , YTrain, k);

save(pathActual + 'DatosGenerados/descriptores_atributos_knn.mat','nombresProblema');
% save(pathActual + 'DatosGenerados/funcion_decision.mat','d');

save(pathActual + "DatosGenerados/espacioCcas_knn_AD_B_CEFG.mat","espacioCcas", 'XoI','YoI', 'nombresProblema')

rmpath('Funciones')