clear, clc, close all

pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath('DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

% 1 {'A'}    2 {'B'}    3 {'C'}    4 {'D'}    5 {'E'}    6 {'F'}    7 {'G'}
%% Seleccionamos las clases involucradas
clasesOI = [1 2 3 4 5 6 7];
clasesIguales = [1 4]; % A y D iguales
XoI = Z;
YoI = Y;
YoI(Y==clasesIguales(2)) = clasesIguales(1);

% 1 {'A'}    2 {'B'}    3 {'C'}    1 {'D'}    5 {'E'}    6 {'F'}    7 {'G'}
clasesIguales = [3 5]; % C y E iguales
YoI(Y==clasesIguales(2)) = clasesIguales(1);

clasesIguales = [3 6]; % CE y F iguales
YoI(Y==clasesIguales(2)) = clasesIguales(1);

clasesIguales = [3 7]; % CEF y G iguales
YoI(Y==clasesIguales(2)) = clasesIguales(1);

clasesOI = unique(YoI)';



% Guardar los descriptores seleccionados
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores;
nombresProblemaOI.clases = nombresProblema.clases(clasesOI);
nombresProblemaOI.simbolos = nombresProblema.simbolos;

%% Seleccionamos los cuatro mejores descriptores para discriminar entre las muestras.
descriptores_seleccionados = ["NumEuler"];
nombresDescriptores = nombresProblemaOI.descriptores;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas_por_nombre_descriptores(XoI, YoI, nombresDescriptores, descriptores_seleccionados);
XoI = XoI(:,espacioCcas);



save(pathActual + "DatosGenerados/espacioCcas_AD_B_CEFG.mat","espacioCcas", 'XoI','YoI', 'nombresProblemaOI')
save(pathActual + "DatosGenerados/nombresProblema_knn.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')