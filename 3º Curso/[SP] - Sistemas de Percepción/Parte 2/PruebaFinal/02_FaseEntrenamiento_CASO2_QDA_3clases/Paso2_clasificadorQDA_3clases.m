clear, clc, close all

pathMain = "Parte 2/PruebaFinal/";
pathActual = pathMain + "02_FaseEntrenamiento_CASO2_QDA_3clases/";

addpath(pathMain + 'Funciones')

%% Cargamos el espacio de características
nombreFichero = "espacioCcas_Circulo_Cuadrado_Triangulo.mat";
load(pathActual + "DatosGenerados/" + nombreFichero);
nombreFichero = 'nombresProblema.mat';
load(pathActual + "DatosGenerados/" + nombreFichero);

clear nombreFichero;

%% Calcular la función de decisión cuadrática
[vectorMedias,matricesCovarianzas,probabilidadPriori] = funcion_ajusta_QDA(XoI,YoI);

[YQDA, d] = funcion_aplica_QDA(XoI, vectorMedias, matricesCovarianzas, probabilidadPriori, unique(YoI));

nombresProblema = [];
nombresProblema.descriptores = nombresProblemaOI.descriptores(espacioCcas);
nombresProblema.clases = nombresProblemaOI.clases;
nombresProblema.simbolos = nombresProblemaOI.simbolos;

save(pathActual + 'DatosGenerados/descriptores_atributos.mat','nombresProblema');
save(pathActual + 'DatosGenerados/funcion_decision.mat','d');

% funcion_representa_muestras_clasificacion_binaria_con_frontera(XoI, YoI, nombresProblemaOI, coeficientes_d12)
save(pathActual + "DatosGenerados/espacioCcas_QDA_Circulo_Cuadrado_Triangulo.mat","espacioCcas", 'XoI','YoI', "nombresProblemaOI", "vectorMedias", "matricesCovarianzas", "probabilidadPriori")


rmpath(pathMain + 'Funciones')