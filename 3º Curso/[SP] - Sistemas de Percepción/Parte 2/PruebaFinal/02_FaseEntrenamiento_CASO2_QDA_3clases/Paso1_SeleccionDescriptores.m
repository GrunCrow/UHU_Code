pathMain = "Parte 2/PruebaFinal/";
pathActual = pathMain + "02_FaseEntrenamiento_CASO2_QDA_3clases/";

addpath(pathMain + 'DatosGenerados')
addpath(pathMain + 'Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

%% Seleccionamos las clases involucradas (Circulos (1), Cuadrados (2) y Triangulos (3))
clasesoI = [1 2 3];
XoI = Z;
YoI = Y;

%% Seleccionamos los cinco mejores descriptores para discriminar
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI,5);
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores;
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos;

save(pathActual + "DatosGenerados/espacioCcas_Circulo_Cuadrado_Triangulo.mat","espacioCcas", 'XoI','YoI')
save(pathActual + "DatosGenerados/nombresProblema.mat",'nombresProblemaOI');

rmpath(pathMain + 'DatosGenerados')
rmpath(pathMain + 'Funciones')