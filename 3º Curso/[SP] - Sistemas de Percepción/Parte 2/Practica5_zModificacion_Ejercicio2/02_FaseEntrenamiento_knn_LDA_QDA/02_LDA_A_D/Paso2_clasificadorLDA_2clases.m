clear, clc, close all

pathActual = "02_FaseEntrenamiento_knn_LDA_QDA/";

addpath(pathActual + 'DatosGenerados')
addpath('Funciones')

%% Cargamos datos de interes

%% Cargamos el espacio de características obtenido en la etapa de selección de descriptores
nombreFichero = "espacioCcas_A_D.mat";
load(nombreFichero);

clear nombreFichero;

%% Calculamos la función de decisión lineal -> Clasificador LDA
[d1, d2, d12, coeficientes_d12] = funcion_calcula_hiperplanoLDA_2Clases_2_3_Dim(XoI, YoI);

%% Representamos muestras y plano del clasificador
close all
funcion_representa_hiperplano_separacion_2_3_Dim(coeficientes_d12, XoI);

load(pathActual + "DatosGenerados/nombresProblema.mat");
% funcion_representa_muestras_clasificacion_binaria_con_frontera(XoI, YoI, nombresProblemaOI, coeficientes_d12)
save(pathActual + "DatosGenerados/espacioCcas_LDA_A_D.mat", "d12", "coeficientes_d12","espacioCcas", 'XoI','YoI', "nombresProblemaOI")


rmpath('DatosGenerados')
rmpath('Funciones')