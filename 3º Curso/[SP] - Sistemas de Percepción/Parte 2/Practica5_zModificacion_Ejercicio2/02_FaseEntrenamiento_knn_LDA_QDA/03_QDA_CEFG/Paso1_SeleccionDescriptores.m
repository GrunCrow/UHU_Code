clear, close all, clc

pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath('DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

X = Z;
clear Z;

% 1 {'A'}    2 {'B'}    3 {'C'}    4 {'D'}    5 {'E'}    6 {'F'}    7 {'G'}
%% Seleccionamos las clases involucradas
clasesoI = [3 5 6 7];
XoI = X((Y == clasesoI(1) | Y == clasesoI(2) | Y == clasesoI(3) | Y == clasesoI(4)),:);
YoI = Y(Y == clasesoI(1) | Y == clasesoI(2) | Y == clasesoI(3) | Y == clasesoI(4));

%% Seleccionamos los cuatro mejores descriptores para discriminar
num_descriptores = 4;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI, num_descriptores);
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores;
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos;

save(pathActual + "DatosGenerados/espacioCcas_CEFG.mat","espacioCcas", 'XoI','YoI', 'nombresProblemaOI')
save(pathActual + "DatosGenerados/nombresProblema_QDA.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')