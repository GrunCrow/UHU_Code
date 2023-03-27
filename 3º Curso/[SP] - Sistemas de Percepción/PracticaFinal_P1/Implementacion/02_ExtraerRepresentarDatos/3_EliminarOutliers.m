%% 2.3.- ELIMINACIÓN DE VALORES ATÍPICOS EN LOS DATOS DEL COLOR DE SEGUIMIENTO

clear, close all

%% Ejercicio 2.3.1
% 2.3.1.- Eliminar valores atípicos o outliers en las muestras de X 
% correspondientes a los píxeles del color de seguimiento. 
% Para ello, se eliminará una instancia completa de esta clase de salida 
% (color de seguimiento) si el valor de cualquiera de sus atributos está 
% fuera de su rango “normal” de variación. Este rango se definirá para cada 
% atributo como [Q1-1.5*RI, Q3+1.5*(Q3-Q1], donde Q1 y Q3 son el primer y 
% tercer cuartil de sus valores (ver figura).

%% Ejercicio 2.3.2
% 2.3.2.- Generar el conjunto de datos final X e Y, sin outliers en la 
% clase del color de seguimiento (las instancias anómalas eliminadas de 
% X también han de eliminarse en Y).

% Función a implementar:
% posOutliers = funcion_detecta_outliers_clase_interes(X,Y,posClaseInteres)
% - X,Y: conjunto de datos entrada-salida
% - posClaseInteres: posición del valor de codificación de la clase de interés en el vector de valores únicos ordenados de Y
% - posOutliers: posiciones de los valores anómalos en el conjunto de datos




% Eliminar valores atipicos.
% 

pathsArchivos = "PracticaFinal_P1/Implementacion/02_ExtraerRepresentarDatos/";

addpath(pathsArchivos + "Funciones")


nombreObjeto = "VariablesGeneradas/XY_Color.mat";
load([pathsArchivos + nombreObjeto])

posClaseInteres = 2;
[Xo,Yo] = funcion_detecta_outliers_clase_interes(X_Color,Y_Color,posClaseInteres);

fichero = 'VariablesGeneradas\XoYo_Color.mat';
save(pathsArchivos+fichero, "Xo","Yo")

rmpath('./Funciones');



%% Ejercicio 2.3.3.
% 2.3.3.- Representar en el espacio RGB todos los valores RGB de los 
% píxeles del color de seguimiento y del fondo de la escena del conjunto 
% de datos final, distinguiendo las muestras del color de seguimiento y 
% las del fondo de la escena

% Representacion de los datos

representa_datos_color_seguimiento(Xo, Yo)

save(pathsArchivos + 'XoYo_Color.mat', "Xo","Yo")