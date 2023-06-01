pathMain = "Parte 2/PruebaFinal/";
pathActual = pathMain + "02_FaseEntrenamiento_CASO1_LDA_clases2a2/03_CuadradoTriangulo/";

addpath(pathMain + 'DatosGenerados')
addpath(pathMain + 'Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

%% Seleccionamos las clases involucradas (Cuadrado (2) y Triangulos (3))
clasesoI = [2 3];
XoI = Z((Y == clasesoI(1) | Y == clasesoI(2)),:);
YoI = Y(Y == clasesoI(1) | Y == clasesoI(2));

%% Seleccionamos los tres mejores descriptores para discriminar entre 
   % las muestras de circulos y cuadrados. 
 
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI,3);
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesoI);

save(pathActual + "DatosGenerados/espacioCcas_Cuadrado_Triangulo.mat","espacioCcas", 'XoI','YoI')
save(pathActual + "DatosGenerados/nombresProblema.mat",'nombresProblemaOI');

rmpath(pathMain + 'DatosGenerados')
rmpath(pathMain + 'Funciones')