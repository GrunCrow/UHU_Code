%% 1. Clasificación basada en Bayes

% BAYES no

% kNN hay que saberlo, diapositiva de reconocimiento de objetos,
% introduccion, ejemplo de estimacion de probabilidades: clasificador
% k-vecinos...

% Hay q saberse la implementacion de K-nn

% Solo se verá hasta el concepto general de K-nn, regresión, formulita...

%% 2. Clasificación basada e distribución normal multivariante

% RECORDANDO ANÁLISIS DISCRIMINANTE

% 1. Teorema de Bayes, clasificador decisor maximo a posteriori

% 2. estimacion de la verosimilitud o probabilidad a posteriori de x en la
% clase k fk(x)

% 3. A partir del conjunto de datos de entrenamiento, diseño de una función
% de decisión para cada clase del problema

% 4. Criterio de clasificación

%% 4. QDA

% Clasificador QDA: Análisis discriminante cuadrático

%% 5. LDA

% Qué es una matriz de covarancia y como hacer una comun a un conjunto de
% clases

% Ejemplo:
XC1 = [ 2   1
        3   2
        3   3
        4   2];

mean(XC1);
%   3   2

var1 = ((2-3)^2+(4-3)^2)/3;
var2 = ((1-2)^2+(3-2)^2)/3;

cov12 = ((2-3)*(1-2))/3;

cov(XC1);


XC2 = [ 6   1
        5   2
        7   3

% QDA - cuadratico, LDA - lineal, la diferencia matemáticamente es que la
% matriz tipo varianza
% mientras QDA considera una matriz de covarianza para cada clase, LDA considera una unica matriz de covarianza para
% todas las clases que tenemos

%% transparencia de dos formas de aplicación lda: k-clases; instancia a clasificar: x = (x1, ..., xp)
% 1. A partir de las funciones de decisión cuadráticas: diseñar k funciones
% de decisión (una función de decisión dk para cada clase k del problema).


%% Análisis Discriminante
% Discriminacion basada en distribucion normal multivariante.
%   - Teorema de Bayes
%   - Estimacion de la verosimilitud o prob a posteriori de x en la clase
%   k, fk(x)
%   - A partir del conjunto de datos de entrenamiento, diseño de una
%   funcion de decision para cada clase del problema
%   - Criterio de clasificación

% QDA con datos balanceados, log(pi k) no es obviable (lo del final
% LDA - misma matriz de covarianza para todas las clases del problema,
% teniendo en cuenta los datos de todas las clases


% pinv -> funcion que hay que saberse, producto inverso



%% KNN