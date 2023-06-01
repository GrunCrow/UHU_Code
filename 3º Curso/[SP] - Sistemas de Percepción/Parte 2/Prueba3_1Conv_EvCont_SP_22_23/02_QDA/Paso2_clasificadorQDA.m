clear, clc, close all

pathActual = "02_QDA/";

addpath(pathActual + 'DatosGenerados')
addpath('Funciones')

%% Cargamos el espacio de características
nombreFichero = "espacioCcas.mat";
load(nombreFichero);
nombreFichero = 'nombresProblema.mat';
load(nombreFichero);

clear nombreFichero;

%% Calcular la función de decisión cuadrática
[vectorMedias,matricesCovarianzas,probabilidadPriori] = funcion_ajusta_QDA(XoI,YoI);

[YQDA, d] = funcion_aplica_QDA(XoI, vectorMedias, matricesCovarianzas, probabilidadPriori, unique(YoI));

nombresProblema = [];
nombresProblema.descriptores = nombresProblemaOI.descriptores;
nombresProblema.clases = nombresProblemaOI.clases;
nombresProblema.simbolos = nombresProblemaOI.simbolos;

save(pathActual + 'DatosGenerados/descriptores_atributos_QDA.mat','nombresProblema');
save(pathActual + 'DatosGenerados/funcion_decision_QDA.mat','d');

% funcion_representa_muestras_clasificacion_binaria_con_frontera(XoI, YoI, nombresProblemaOI, coeficientes_d12)
save(pathActual + "DatosGenerados/espacioCcas_QDA.mat","espacioCcas", 'XoI','YoI', "nombresProblemaOI", "vectorMedias", "matricesCovarianzas", "probabilidadPriori")


rmpath('Funciones')