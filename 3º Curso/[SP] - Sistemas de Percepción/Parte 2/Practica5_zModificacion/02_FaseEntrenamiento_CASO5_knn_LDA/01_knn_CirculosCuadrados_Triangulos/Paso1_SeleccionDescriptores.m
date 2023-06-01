clear, clc, close all

pathActual = "02_FaseEntrenamiento_CASO5_knn_LDA/";

addpath('DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

% (Circulos (1), Cuadrados (2) y Triangulos (3))
%% Seleccionamos las clases involucradas
clasesOI = [1 2 3];
clasesIguales = [1 2];
XoI = Z;
YoI = Y;
YoI(Y==clasesIguales(1)) = clasesIguales(2); % Creamos la clase circulo-cuadrado -> es decir donde hay cuadrado sera circulo

clasesOI = unique(YoI);

%% Seleccionamos los cuatro mejores descriptores para discriminar entre las muestras.
n_descriptores = 3;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI,n_descriptores);
XoI = XoI(:,espacioCcas);

% Guardar los descriptores seleccionados
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores;
nombresProblemaOI.clases = nombresProblema.clases(clasesOI);
nombresProblemaOI.simbolos = nombresProblema.simbolos;

save(pathActual + "DatosGenerados/espacioCcas_CirculoCuadrado_Triangulo.mat","espacioCcas", 'XoI','YoI', 'nombresProblemaOI')
save(pathActual + "DatosGenerados/nombresProblema_knn.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')