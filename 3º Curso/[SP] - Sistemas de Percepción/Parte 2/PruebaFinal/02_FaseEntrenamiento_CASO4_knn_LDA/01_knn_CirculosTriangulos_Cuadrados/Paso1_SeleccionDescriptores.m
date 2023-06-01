clear, clc, close all

pathMain = "Parte 2/PruebaFinal/";
pathActual = pathMain + "02_FaseEntrenamiento_CASO4_knn_LDA/";

addpath(pathMain + 'DatosGenerados')
addpath(pathMain + 'Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

% (Circulos (1), Cuadrados (2) y Triangulos (3))
%% Seleccionamos las clases involucradas
clasesOI = [1 2 3];
XoI = Z;
YoI = Y;
YoI(Y==3) = 1; % Creamos la clase circulo-triangulo -> es decir donde hay triangulos sera circulo

%% Seleccionamos los cuatro mejores descriptores para discriminar entre las muestras.
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI,4);
XoI = XoI(:,espacioCcas);

% Guardar los descriptores seleccionados
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores;
nombresProblemaOI.clases = nombresProblema.clases(clasesOI);
nombresProblemaOI.simbolos = nombresProblema.simbolos;

save(pathActual + "DatosGenerados/espacioCcas_CirculoTriangulo_Cuadrado_knn.mat","espacioCcas", 'XoI','YoI', 'nombresProblemaOI')
save(pathActual + "DatosGenerados/nombresProblema_knn.mat",'nombresProblemaOI');

rmpath(pathMain + 'DatosGenerados')
rmpath(pathMain + 'Funciones')