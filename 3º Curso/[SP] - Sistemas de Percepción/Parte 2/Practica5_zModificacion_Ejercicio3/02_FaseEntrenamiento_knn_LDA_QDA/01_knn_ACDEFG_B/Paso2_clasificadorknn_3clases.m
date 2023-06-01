clear, clc, close all

pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath('Funciones')

%% Cargamos el espacio de características
nombreFichero = "espacioCcas_ACDEFG_B.mat";
load(pathActual + "DatosGenerados/" + nombreFichero);
nombreFichero = 'nombresProblema_knn_ACDEFG_B.mat';
load(pathActual + "DatosGenerados/" + nombreFichero);

clear nombreFichero;

nombresProblema = [];
nombresProblema.descriptores = nombresProblemaOI.descriptores;
nombresProblema.clases = nombresProblemaOI.clases;
nombresProblema.simbolos = nombresProblemaOI.simbolos;

%% Entrenamiento del clasificador k-NN
XTrain = XoI;
YTrain = YoI;

% YTest = funcion_knn(XTest, XTrain , YTrain, k);

save(pathActual + 'DatosGenerados/descriptores_atributos_knn.mat','nombresProblema');
% save(pathActual + 'DatosGenerados/funcion_decision.mat','d');

save(pathActual + "DatosGenerados/espacioCcas_knn_ACDEFG_B.mat","espacioCcas", 'XoI','YoI', 'nombresProblema')

rmpath('Funciones')