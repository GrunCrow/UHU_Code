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
clasesIguales_1 = [1 3 4];
clasesIguales_2 = [5 6 7];

YoI = Y;
% unique(YoI);
YoI(Y==clasesIguales_1(2) | Y==clasesIguales_1(3)) = clasesIguales_1(1);
% unique(YoI);
YoI(Y==clasesIguales_2(2) | Y==clasesIguales_2(3)) = clasesIguales_2(1);
% unique(YoI);

clasesoI = [clasesIguales_1(1) clasesIguales_2(1)];

XoI = X((YoI == clasesoI(1) | YoI == clasesoI(2)),:);
YoI = YoI(YoI == clasesoI(1) | YoI == clasesoI(2));

%% Seleccionamos los tres mejores descriptores para discriminar
% Extensión (Inv. Rotación), Hu1 y Hu2
descriptores_seleccionados = ["Hu3", "DF4", "DF6"];
nombresDescriptores = nombresProblema.descriptores;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas_por_nombre_descriptores(XoI,YoI,nombresDescriptores, descriptores_seleccionados);
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesoI);

save(pathActual + "DatosGenerados/espacioCcas_ACD_EFG.mat","espacioCcas", 'XoI','YoI')
save(pathActual + "DatosGenerados/nombresProblema_LDA.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')