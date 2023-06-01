clear, clc, close all

pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath('DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

X = Z;
clear Z;

% 1 {'A'}    2 {'B'}    3 {'C'}    4 {'D'}    5 {'E'}    6 {'F'}    7 {'G'}
%% Seleccionamos las clases involucradas
clasesOI = [1 3 4];

XoI = X((Y == clasesOI(1) | Y == clasesOI(2) | Y == clasesOI(3)),:);
YoI = Y(Y == clasesOI(1) | Y == clasesOI(2) | Y == clasesOI(3));

clasesOI = unique(YoI)';

%% Seleccionamos los cuatro mejores descriptores para discriminar entre las muestras.
num_descriptores = 3;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI, YoI, num_descriptores);
XoI = XoI(:,espacioCcas);

% Guardar los descriptores seleccionados
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesOI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesOI);

save(pathActual + "DatosGenerados/espacioCcas_A_C_D.mat","espacioCcas", 'XoI','YoI', 'nombresProblemaOI')
save(pathActual + "DatosGenerados/nombresProblema_knn_A_C_D.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')