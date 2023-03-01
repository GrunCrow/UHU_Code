%% NOCIONES BÁSICAS PROGRAMACIÓN EN MATLAB

%% EJERCICIOS PARA PRACTICAR

% Sea a = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

a = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

% Accede a los dos primeros elementos de la tercera columna
a(1:2,3)

% Accede a al primer y tercer elemento de la segunda fila    
a(2,[1 3])

% Accede a los elementos 1, 2 y 4 de la última fila   
a(end,[1 2 4])

% Accede a la matriz 3x3 centrada en el elemento de la fila 2, columna 3
f=2; c=3;
a(f-1:f+1,c-1:c+1)

% Elimina la segunda columna de a
a(2,:) = []

% Intercambia segunda y tercera columna de a
numColum = size(a,2);
if numColum > 3 % se asume que tiene un mínimo de 3 columnas
   a = a(:,[1 3 2 4:end])
else
   a = a(:,[1 3 2])
end


%% EJERCICIOS PROPUESTOS

% Ejercicio1: 
% a) Crea un vector V de 10 elementos con números enteros aleatorios entre 0 y 10.
% b) Genera un vector binario donde el 1 binario señala a los elementos
% del vector que son menores o iguales a 5.
% c) Encuentra con la función find las posiciones en el vector de esos elementos
% d) Encuentra la posición del valor máximo de V
% e) Ordena los elmentos del vector, de mayor a menor, obteniendo las
% posiciones donde se encuentran en V


% Progrmacion con bucles
clear,clc

% a) Crea un vector V de 10 elementos con números enteros aleatorios entre 0 y 10.

V = round(10*rand(1,10));

% b) Genera un vector binario donde el 1 binario señala a los elementos
% del vector que son menores o iguales a 5.

% b) - Programacion con bucle
V_binario = false(size(V)); % inicializamos el vector binario del mismo
                            % tamaño que V. Observar que size(V) = [1 10]
                            % Inicialmente todo a 0 binario, solo ponemos
                            % los1's binarios
numElem = length(V);
for i=1:numElem
    if V(i) <= 5
        V_binario(i) = true;
    end
end

[V ; V_binario] % para ver el resultado
        
% b)- Programación matricial matlab- es lo que hay que hacer
V_binario = V <= 5 % dejamos que se vea para verificar que se obtiene lo mismo


% c) Encuentra con la función find las posiciones en el vector de esos elementos
pos_1binarios = find(V_binario)


% d) Encuentra la posición del valor máximo de V

% 1 opción : utilizando la función max
[valorMaximoV, posValorMaximoV] = max(V);
V
valorMaximoV
posValorMaximoV
% si hubiese varios valores con valor máximo, sólo se deveuelve  la posición
% del primer máximo

% Otra opción: utilizando find (si se  quieren todas las posiciones
% posibles)
posValorMaximoV = find (V== max(V))

% e) Ordena los elmentos del vector, de mayor a menor, obteniendo las
% posiciones donde se encuentran en V
V
[VOrdenado , posVOrdenado] = sort(V,'descend') % por defecto, ordena en orden ascendente



% Ejercicio2: 
% a) Crea una matriz M de 2 filas y 3 columnas con números enteros aleatorios
% entre 0 y 10.
% b) Genera una matriz binaria de las mismas dimensiones, que indique los 
% valores en M que tienen valores entre 3 y 8
% c) Calcula la media de esos elementos
% d) Reemplaza el valor de esos elementos, asignándoles un valor -1

% a) Crea una matriz M de 2 filas y 3 columnas con números enteros aleatorios
% entre 0 y 10.
clear, clc, M = round(10*rand(2,3))


% b) Genera una matriz binaria de las mismas dimensiones, que indique los 
% valores en M que tienen valores entre 3 y 8

% b) Programación con bucle for y sentencia if
M_binaria = true(size(M)) % ahora inicializamos a 1's binarios, solo cambiaremos 
                          % los elementos que no cumplen la condición
[numFilas, numColumnas] = size(M);
for i=1:numFilas % recorremos las filas
    for j=1:numColumnas  % para cada fila, recorremos cada columna
        if not( M(i,j)>3 & M(i,j)<8 )
            M_binaria(i,j) = false;
        end
    end
end
M
M_binaria

% b) Programación matricial matlab: hay que hacerlo de esta forma
M_binaria = M > 3 & M < 8  % es equivalente a la programación anterior (1 sóla línea de código)

% c) Calcula la media de esos elementos
M_binaria = M > 3 & M < 8;  % matriz lógica que me indica las posiciones que nos interesan
valoresInteres = M( M_binaria) % osbservar que obtenemos en un vector los elementos de M que nos interesan
mediaElem = mean(valoresInteres)

% es importante observar esa forma de acceder a valores que interesan en
% una matriz de matlab (se pasa como argumento una matriz lógica de la
% misma dimensión; se accede a los valores que indican los 1's binarios)

% En una línea:
mediaElem = mean ( M (M > 3 & M < 8) ) 

% d) Reemplaza el valor de esos elementos, asignándoles un valor -1
M_binaria = M > 3 & M < 8;  % matriz lógica que me indica las posiciones que nos interesan
M (M_binaria) = -1

% Observar cómo una misma forma de escribir el acceso a  los elementos de
% una matriz, puede tener efectos distintos:
% valoresInteres = M( M_binaria) --> genera vector con los elementos de M
% M (M_binaria) = -1 ; genera matriz M, modificando los valores que nos interesan


% Ejercicio3:
% a) Genera dos matrices A y B, 5x5, de números enteros aleatorios entre 0 y 10
% b) Calcula la media de los valores de A en aquellos puntos donde B es > 5

% a)
clear, clc, A = round(10*rand(5)) , B = round(10*rand(5))

% b)
posInteres = B > 5;
valoresInteres = A( posInteres);
mediaPosInteres = mean(valoresInteres)

% en una línea: 
mediaPosInteres = mean  ( A(B>5) )


% Ejercicio4:
% a) Generar una matriz A, 10x10, de números enteros aleatorios entre 0 y 5 
% b) Guarda en un vector fila, llamado valoresA, los valores distintos
% que aparecen en A 
% c) Inicializa con ceros un vector fila, llamado conteoValores,
% de tantos elementos como valores distintos haya en A
% d) Guarda en las posiciones de conteoValores el número de veces que
% aparece en A cada uno de sus posiles valores
% e) Representa con stem, valoresA frente a conteoValores

% a) Generar una matriz A, 10x10, de números enteros aleatorios entre 0 y 5 
clear, clc, A = round(5*rand(10))

% b) Guarda en un vector fila, llamado valoresA, los valores distintos
% que aparecen en A 
valoresA = unique(A)' % observar que unique devuelve vector columna, se traspone

% c) Inicializa con ceros un vector fila, llamado conteoValores,
% de tantos elementos como valores distintos haya en A
conteoValores = zeros(size(valoresA))

% d) Guarda en las posiciones de conteoValores el número de veces que
% aparece en A cada uno de sus posiles valores
for i=1:length(valoresA) % recorresmos el  vector de los valores sin repetición de A
   
    valor_i = valoresA(i); % en cada iteración, nos quedamos con cada valor posible de A
    posInteres = A == valor_i; % matriz binaria que me marca los valores de A con ese valor
    numVecesValor_i = sum(posInteres(:)); % sumamos  los 1's binario
    % otra opción:  [f, c] = find(posInteres); numVecesValor_i = length(f);
    % otra opción numVecesValor_i = length(find(posInteres(:)))
    conteoValores(i) = numVecesValor_i;
    
end

% e) Representa con stem, valoresA frente a conteoValores
close all,
stem(valoresA, conteoValores,'.r') % igual que plot para que conozcais otra función
xlabel('Valores Posibles de A')
ylabel('Numero de veces que aparece cada valor en A')
grid on
title('Histograma de valores de A')


% Ejercicio5:

% Función: varLogica = funcion_compara_matrices(m1,m2)

% Diseñar una función que reciba como entradas dos matrices de la misma
% dimensión. La función debe devolver una variable lógica, con true si las
% matrices son iguales y false  en caso contrario.
% Para ello la función deberá:
% - Calcular una matriz diferencias (resta de las dos matrices de entrada)
% - Calcula el valor máximo y mínimo de esta matriz diferencias
% - Si el valor máximo es igual al valor mínimo y cualquiera de ellos tiene
% el valor 0, entonces las matrices de entrada son iguales

% Observación: si las matrices no tienen la misma dimensión la función
% únicamente debe advertir por el command window este hecho (para ello,
% puedes utilizar la función instrucción: disp('cadena de texto a mostrar').

% Guardar la función en un directorio llamado funciones, y, añadiendo el
% path a este directorio, llámala en distintas situaciones para comprobar
% su correcto funcionamiento.

addpath('funciones')
M1 = [1; 2] ; M2 = [1; 2; 3];
varLogica = funcion_compara_matrices(M1, M2)

M1 = [1; 2; 3] ; M2 = [1; 2; 3];
varLogica = funcion_compara_matrices(M1, M2)

M1 = [1 3 1; 2 9 -1; 3 -5 7] ; M2 = [1 3 1; 2 9 -1; 3 -5 7];
varLogica = funcion_compara_matrices(M1, M2)

M1 = rand(10); M2 = rand(10);
varLogica = funcion_compara_matrices(M1, M2)

rmpath('funciones')

