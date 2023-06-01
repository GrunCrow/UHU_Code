pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath('DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

X = Z;
clear Z;

% 1 {'A'}    2 {'B'}    3 {'C'}    4 {'D'}    5 {'E'}    6 {'F'}    7 {'G'}
%% Seleccionamos las clases involucradas
clasesoI = [1 4];
XoI = X((Y == clasesoI(1) | Y == clasesoI(2)),:);
YoI = Y(Y == clasesoI(1) | Y == clasesoI(2));

%% Seleccionamos los tres mejores descriptores para discriminar
% Extensión (Inv. Rotación), Hu1 y Hu2
descriptores_seleccionados = ["Extension_BBox(Invariante Rotacion)", "Hu1", "Hu2"];
nombresDescriptores = nombresProblema.descriptores;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas_por_nombre_descriptores(XoI,YoI,nombresDescriptores, descriptores_seleccionados);
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesoI);

save(pathActual + "DatosGenerados/espacioCcas_A_D.mat","espacioCcas", 'XoI','YoI')
save(pathActual + "DatosGenerados/nombresProblema.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')