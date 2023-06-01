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

% Se define la variable pathsArchivos con la ruta donde se encuentran los archivos.
pathsArchivos = "PracticaFinal_P1/Implementacion/02_ExtraerRepresentarDatos/";

% Se añade la ruta donde se encuentran las funciones a la ruta de MATLAB.
addpath(pathsArchivos + "Funciones")

% Se define la variable nombreObjeto con la ruta donde se encuentra el archivo XY_Color.mat.
nombreObjeto = "VariablesGeneradas/XY_Color.mat";

% Se carga el archivo XY_Color.mat y se guardan los datos RGB del objeto y del fondo en dos matrices separadas.
load([pathsArchivos + nombreObjeto])
posClaseInteres = 2;
[Xo,Yo] = funcion_detecta_outliers_clase_interes(X_Color,Y_Color,posClaseInteres);

%% Ejercicio 2.3.3.
% Se representa en el espacio RGB todos los valores RGB de los píxeles del color de seguimiento y del fondo de la escena
% del conjunto de datos final, distinguiendo las muestras del color de seguimiento y las del fondo de la escena.

% Se representa en un gráfico 3D los datos RGB del objeto y del fondo de la escena.
representa_datos_color_seguimiento(Xo, Yo)

% Se define la variable fichero con la ruta donde se va a guardar la matriz Xo y Yo.
fichero = 'VariablesGeneradas\XoYo_Color.mat';

% Se guarda la matriz Xo y Yo en el archivo XoYo_Color.mat.
save(pathsArchivos+fichero, "Xo","Yo")

% Se elimina la ruta de las funciones de MATLAB.
rmpath(pathsArchivos + 'Funciones');