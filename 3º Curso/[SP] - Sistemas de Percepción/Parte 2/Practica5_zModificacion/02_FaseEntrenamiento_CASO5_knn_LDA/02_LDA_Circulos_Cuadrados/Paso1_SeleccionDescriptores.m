pathActual = "02_FaseEntrenamiento_CASO5_knn_LDA/";

addpath('DatosGenerados')
addpath('Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

X = Z;
clear Z;

% Circulos (1), Cuadrados (2) y Triangulos (3)
%% Seleccionamos las clases involucradas (Circulos (1) y Cuadrado (2))
clasesoI = [1 2];
XoI = X((Y == clasesoI(1) | Y == clasesoI(2)),:);
YoI = Y(Y == clasesoI(1) | Y == clasesoI(2));

%% Seleccionamos los tres mejores descriptores para discriminar entre 
   % las muestras de circulos y cuadrados. 
descriptores_seleccionados = ["DF3", "DF7", "Hu3"];
nombresDescriptores = nombresProblema.descriptores;
[espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas_por_nombre_descriptores(XoI,YoI,nombresDescriptores, descriptores_seleccionados);
XoI = XoI(:,espacioCcas);

%% Por último, guardamos el nombre del problema de interés en este caso.
nombresProblemaOI = [];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCcas);
nombresProblemaOI.clases = nombresProblema.clases(clasesoI);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesoI);

save(pathActual + "DatosGenerados/espacioCcas_Circulo_Cuadrado.mat","espacioCcas", 'XoI','YoI')
save(pathActual + "DatosGenerados/nombresProblema.mat",'nombresProblemaOI');

rmpath('DatosGenerados')
rmpath('Funciones')