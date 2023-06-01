clear, close all, clc

pathActual = "02_QDA/";

addpath('01_GeneracionDatos/DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

X = Z;
clear Z;

% 1     2      3    4   5   6   7
%% Seleccionamos las clases involucradas
clasesoI = [1 2 3 4 5 6 7];

XoI = X((Y == clasesoI(1) | Y == clasesoI(2) | Y == clasesoI(3) | Y == clasesoI(4) | Y == clasesoI(5) | Y == clasesoI(6) | Y == clasesoI(7)  ) ,:);
YoI = Y(Y == clasesoI(1) | Y == clasesoI(2) | Y == clasesoI(3) | Y == clasesoI(4) | Y == clasesoI(5) | Y == clasesoI(6) | Y == clasesoI(7));


clasesIguales = [1 7];

% unique(YoI);
YoI(YoI==clasesIguales(2)) = clasesIguales(1);


%% Seleccionamos los 22 primeros descriptores para discriminar
num_descriptores = 22;
% [espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI, num_descriptores);
espacioCcas = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22];
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesoI);

save(pathActual + "DatosGenerados/espacioCcas.mat","espacioCcas", 'XoI','YoI', 'nombresProblemaOI')
save(pathActual + "DatosGenerados/nombresProblema.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')