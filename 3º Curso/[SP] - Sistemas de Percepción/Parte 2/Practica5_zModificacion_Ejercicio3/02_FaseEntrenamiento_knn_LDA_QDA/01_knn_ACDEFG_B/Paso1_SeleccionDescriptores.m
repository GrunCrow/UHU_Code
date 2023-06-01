clear, clc, close all

pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath('DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

% 1 {'A'}    2 {'B'}    3 {'C'}    4 {'D'}    5 {'E'}    6 {'F'}    7 {'G'}
%% Seleccionamos las clases involucradas
clasesOI = [1 2 3 4 5 6 7];
clasesIguales = [1 3 4 5 6 7]; % A y D iguales
XoI = Z;
YoI = Y;
YoI(Y==clasesIguales(2) | Y==clasesIguales(3) | Y==clasesIguales(4) | Y==clasesIguales(5) | Y==clasesIguales(6)) = clasesIguales(1);
clasesOI = unique(YoI)';

%% Seleccionamos los cuatro mejores descriptores para discriminar entre las muestras.
descriptores_seleccionados = ["NumEuler"];
nombresDescriptores = nombresProblema.descriptores;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas_por_nombre_descriptores(XoI, YoI, nombresDescriptores, descriptores_seleccionados);
XoI = XoI(:,espacioCcas);

% Guardar los descriptores seleccionados
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesOI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesOI);

save(pathActual + "DatosGenerados/espacioCcas_ACDEFG_B.mat","espacioCcas", 'XoI','YoI', 'nombresProblemaOI')
save(pathActual + "DatosGenerados/nombresProblema_knn_ACDEFG_B.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')