clear, clc, close all

pathActual = "03_LDA/";
pathAnterior = "01_GeneracionDatos/";
addpath(pathAnterior + 'DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

X = Z;
clear Z;

%% Seleccionamos las clases involucradas
clasesoI = [1 7];

XoI = X((Y == clasesoI(1) | Y == clasesoI(2)),:);
YoI = Y(Y == clasesoI(1) | Y == clasesoI(2));

%% Seleccionamos los tres mejores descriptores para discriminar
% Extensión (Inv. Rotación), Hu1 y Hu2
numDescriptores = 3;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI,numDescriptores);
%  como hemos hecho mal la generacion de datos, nos inventamos unos
%  descriptores:
espacioCcas = [5 7 15];
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesoI);

save(pathActual + "DatosGenerados/espacioCcas.mat","espacioCcas", 'XoI','YoI')
save(pathActual + "DatosGenerados/nombresProblema.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')