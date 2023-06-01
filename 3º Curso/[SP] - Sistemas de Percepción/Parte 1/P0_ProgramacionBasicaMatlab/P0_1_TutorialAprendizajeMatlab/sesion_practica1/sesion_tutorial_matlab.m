%% TUTORIAL MATLAB

%% ORGANIZACION: CURRENT DIRECTORY, COMMAND WINDOW, WORKSPACE, COMMAND HISTORY

% Ejemplo Suma y resta de dos numeros
a =1  
A = 2
suma = a+A; resta = a-A % Realiza la suma y la resta
suma = a+A, resta = a-A; % Realiza la suma y la resta -> el ';' hace que no salga por el command window

% OBSERVACIONES:
% el carácter “,” para separar comandos
% el símbolo “%” para introducir comentarios en el código
% % si no ponemos “;” el resultado se muestra en pantalla


%% Workspace: consultar tipo de variable, generar y cargar archivos .mat

whos A  % para ver el tipo de variable
% double ; real de punto flotante con 8 bytes
% empleado por Matlab por defecto en la definición de variables

save variables A a suma resta 
save('datos/variables','A','a','suma','resta')
% Guarda las variables en fichero matlab variables.mat

clear  % elimina las variables del workspace

load variables.mat 
% carga en el Workspace las variables almacenadas en el fichero .mat
clear
ruta = 'datos/variables';
load(ruta,'suma','resta')  
% carga en el Workspace variables específicas del fichero .mat
clear

clc % borra pantalla del command window.


%% Ayuda matlab
help save  % te ofrece ayuda respecto la función  por el command window
doc load % abre la ayuda Matlab para dar la información
type unique % edita el contenido de la función por command window
edit mat2gray  % abre fichero .m con la función


%% DEFINICIÓN DE MATRICES

% LAS VARIBLES EN MATLAB SON MATRICES. CASOS PARTICULARES:
% NUMERO: MATRIZ DE UNA FILA Y UNA COLUMNA
% VECTORES: VECTOR FILA (MATRIZ DE 1 FILA) O VECTOR COLUMNA (MATRIZ DE UNA
% COLUMNA)

% []: Para concatenar informacion
% Definición con corchetes 
% Los corchetes se usan para concatenar informacion
% Si la información va separada por espacios o comas, se añade horizontalmente
% Si va seperada por "puntos y coma" se añade verticalmente

% EJEMPLOS:

% NÚMERO
a = 1
whos a

% VECTORES

b = [2 2], whos b
b = [2; 2], whos b
b = [2, 2]

c = [a b 3] ; d = [2; 2]; e = [a; d]; f = [e; d; 3]; cTras = c';

% Operador : para la definición de vectores filas con los valores indicados
valorInicio = 1; valorFinal = 6; paso = 1;
A = valorInicio:paso:valorFinal

% Ejemplos
A = 1:6
B = 1:2:5
C = 5:-1:1


% MATRICES: 
g = [1 2 3; 4 5 6 ]
whos g

% Crea h: resultado de añadir a a g una última columna con valores 7 y 8


h = [g [7;8]]


% Crea i: añdiendo a h una última fila con los valores del vector c


i = [h; c]


%% Inicializacion de matrices
A = []
B = ones(2) % solo un numero es nxn la martriz (ones es de 1's)
C = ones(2,3)
D = zeros(3,1)
F = true(3) % solo un numero = matriz cuadrada logica, llena de maginarios, porq es true
G = false(2,4)

H = eye(4) % matriz identidad 4x4

I = rand(4,3) % matriz 4x3 de números distribución probabilidad uniforme entre 0-1

J = randn(100,1)  % vector columna de 100 elementos
% generados según distribución gaussiana de media cero y desviación típica 1


%% ACCESO A LOS ELEMENTOS DE UNA MATRIZ: 

% Con paréntesis: (fila/s , columna/s) , las posiciones de filas y columnas
% se indican mediante vectores

clear

a = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

a11 = a(1,1)
a23 = a(2,3)
a
UltimoElementoSegundaFila = a(2,end)
UltimoElementoTerceraColumna = a(end,3)

% : hace referencia a todos los elementos (de una fila, de una columna, de
% una matriz)
a
SegundafilaCompleta = a(2,:)
UltimaColumnaCompleta = a(:,end)

% Para acceder a todos los elementos de una matriz y almacenarlos en un
% vector columna
a
b = a(:) 

% EJEMPLOS:
clc, clear
A = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

% Cuatro Primeros valores de la segunda fila
A(2,[1 2 3 4])
A(2,1:4)
f = 2; numElem = 1:4; A(f,numElem)

% ¿Qué obtenemos en estas llamadas a elemento de A?
A
f = [2 1]; A(f,:)
c = [1 4], A(end,c)
A(2:3,1:2:5)

% CREAR UNA MATRIZ B DONDE SE INTERCAMBIEN LAS DOS PRIMERAS FILAS DE A
B = A([2 1 3:end],:)


% Guardar en B, la segunda fila de A



B = A(2,:)

% Eliminar de B el número de la segunda columna: 
B = B(1,[1 3:end])
B = B([1 3:end]) % al ser un vector no hay que indicar filas y columnas,
                 % sólo el número de elemento
B(2) = []

% Eliminar de A la segunda y cuarta fila de A



A([2 4],:) = []

% Añadir el contenido de B debajo de A




A = [A ; B]

% Hacer que las matrices encajen


B = [B 1 2 3]
A = [A ; B]

% Añadir una nueva columna a A con valores 5, 10 y 15



A = [A [5; 10; 15]]

% Modificar A y poner el contenido de las tres últimas columnas,
% debajo de las tres primeras




A1 = A(:,1:3)
A2 = A(:,4:end)
A = [A1; A2]


%% Ejercicios para practicar:

% Sea a = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

% Accede a los dos primeros elementos de la tercera columna

% Accede a al primer y tercer elemento de la segunda fila    

% Accede a los elementos 1, 2 y 4 de la última fila      

% Accede a la matriz 3x3 centrada en el elemento de la fila 2, columna 3

% Elimina la segunda columna de a

% Intercambia segunda y tercera columna de a



%% OPERACIONES CON ELEMENTOS Y MATRICES

clear

A = round(5*rand(2))
B = round(10*rand(3,2))

[A B] ; [A;B]

% Operaciones con constantes
A
A+1
2*A
A/2
(3+2*A)/23*ones(2)

A
A^2
A.^2


% Operaciones entre matrices
A+B
B(3,:) = [];
A
B
A+B

A = [1 0 5]; B = [2 4 1];
A*B  % PRODUCTO MATRICIAL -> solo se puede hacer vector fila * vector columna
A, B'
PMatric = A*B'  
A, B
PPunto_a_Punto = A.*B
A.^B

%% TIPO DE DATOS: LÓGICO
% logical ; un bit

%% TIPOS DE DATOS: NUMÉRICOS
% int8 ; entero con signo de 8 bits
% int16 ; entero con signo de 16 bits
% int32 ; entero con signo de 32 bits
% int64 ; entero con signo de 64 bits
% uint8 ; entero sin signo de 8 bits
% uint16 ; entero sin signo de 16 bits
% uint32 ; entero sin signo de 32 bits
% uint64 ; entero sin signo de 64 bits
% single ; real de punto flotante con 4 bytes
% double ; real de punto flotante

A = uint8(200); whos A
B = A+55
C = A+200  
% Las variables de salida se generan con el mismo formato de las de entrada



%% DEFINICION DE VARIABLES TIPO CARÁCTER Y CADENAS DE TEXTO

A = 'Hola'
whos A
PrimerCaracter = A(1)

B = 'Como estas';

C = [A; B]


%% PARA COMBINAR CADENAS DE DISTINTA LONGITUD O VARIABLES DE DISTINTO TIPO

% USAR UN ARRAY DE STRINGS
A = "Hola"
whos A
B = "Como estas";
C = [A; B]

% USAR CELDAS, VARIABLES FORMATO TIPO CELL (MATRICES DE CELDAS, CADA CELDA
% PUEDE CONTENER DISTINTO TIPO DE INFORMACIÓN)

% Para crear variables tipo celdas, se utilizan las llaves {}, no los
% corchetes
C = cell('');   whos C
C{1,1} = A;
C{1,2} = B;
whos C
C
C = {A, B}
c

C = [C ; {'Estoy bien', 'Gracias'}];

C  

C(1,2) % con () nos referimos a la celda de la primera fila, segunda columna
C{1,2} % al utilizar llaves, accedemos al contenido de la celda

% Podemos mezclar en las celdas distintos tipos de datos
D = cell('');
D{1,1} = 'Hola';
D{2,1} = true;
D{3,1} = 2*eye(3);
D
D'

% Los arrays de celdas permiten almacenar conjuntos de datos heterogéneos,
% de distinto tipo
D = cell('');
numDatos = 200;
D{1,1} = rand(numDatos,1);
D{1,2} = round(2*rand(numDatos,1));
datos = categorical(numDatos,1);
datos(1:2:numDatos,1) = categorical("hombre");
datos(2:2:numDatos,1) = "mujer";
D{1,3} = datos;



%% DEFINICIÓN VARIABLES TIPO ESTRUCTURAS

Campos = [];
Campos.opciones = [];
Campos.valores = [];
Campos.opciones{1} = 'Escalado';
Campos.opciones{2} = 'Normalizacion';
Campos.valores{1,1} = true;
Campos.valores{1,2} = false;
Campos.valores{2,1} = [3 2];
Campos.valores{2,2} = ones(2);


%% VENTANAS TIPO FIGURE Y REPRESENTACIONES CON PLOT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% EJEMPLO REPRESENTACIONES CON PLOT
figure
figure('Name', 'Esta es la Figura Numero 2')
figure(4), set(4, 'Name', 'Esta es la figura 4')

close all % Cierra todas las ventanas tipo figure

% REPRESENTAR UN SENO ENTRE 0 Y 2PI
clear

 x=0:2*pi/1000:2*pi;
 y=sin(x);
 
 figure % crea una ventana gráfica y es la actual
 plot(x,y); % dibuja gráfico en ventana actual (y frente a x)
 
 xlabel('Grados en radii') % texto para el eje x
 ylabel('Seno') % texto para el eje y
 title ('Ejemplo') % texto para el título
 XMIN = 0; XMAX = 7; YMIN = -1.2; YMAX = 1.2; % cambiar la escala a los ejes
 axis([XMIN XMAX YMIN YMAX])
 
 
 % REPRESENTAR EN EL MISMO GRÁFICO DOS SENOS DESPLAZADOS DEL ANTERIOR
 
 y1=sin(x-0.25); % otra función
 y2=sin(x-0.5); % otra función
 hold on % mantiene la ventana anterior para que se dibuje en ella el próximo gráfico sin borrar dicha ventana
 plot(x,y1,'.r', x,y2,'g') % dos curvas
 legend('sen(x)','sen(x-0.25)','sen(x-0.5)') % leyendas
 grid on % para dibujar
 
 
 % EJEMPLO DE REPRESENTACIÓN EN 3D
 valores = -4*pi:0.1:4*pi;
 xnew = sin(valores);
 ynew = cos(valores);
 znew = valores;
 figure,
 plot3(xnew,ynew,znew)
 
 % Varias gráficas en una misma ventana
 figure,
 subplot(1,2,1), plot(x,y, 'b', x,y1,'.r', x,y2,'g')
 legend('sen(x)','sen(x-0.25)','sen(x-0.5)') % leyendas
 subplot(1,2,2), plot3(xnew,ynew,znew), grid on
 
 
 %% FAMILIARIZARSE CON ALGUNAS FUNCIONES MATLAB GENÉRICAS
 
% addpath  
% Lee el fichero .mat del directorio datos
load variables.mat

addpath('datos')
load variables.mat
clear, rmpath('datos')

addpath('../datos')
load variables.mat
clear, rmpath('../datos')


%  ceil, floor, round

% unique
A = round(10*rand(1,10))
unique(A) % vector fila, A es vector fila
B = round(10*rand(3))
unique(B) % vector columna, hace la operación con B(:), que es vector columna


%  sum, prod, max, min, mean, std, median

% Crea una matriz 2x3 y calcula: 
% Vector fila que contenga la suma de cada columna
% Vector columna que contenga el producto de cada fila
% Media de todos elmentos

clear
A = round(10*rand(2,3))
sum(A)
sum(A,2)
sum(sum(A))
sum(A(:))

A
prod(A,2)

A
mean(A)
mean(A(:))

%  length (para vectores sólo), size
A = round(10*rand(1,10))
length(A)

A = round(10*rand(2,3))
[numFilas, numColumnas] = size(A)
size(A,1) % número de filas
size(A,2) % número de columnas

A = round(10*rand(2,3,3))
whos A
[numFilas, numColumnas, numMatrices] = size(A)

% Guardar en B, la segunda matriz de A
B = A(:,:,2);


%%  SENTENCIAS DE CONTROL DE FLUJO: if, switch, for, while 
% Funciones de modificación/interrupción de flujo en bucles: continue,
% break

% Consultar sintaxis en material facilitado


%% OPERADORES RELACIONALES 
% eq - Equal = =
% ne - Not equal ~ =
% lt - Less than <
% gt - Greater than >
% le - Less than or equal < =
% ge - Greater than or equal > =
 
a
%% OPERADORES LÓGICOS 
% and - Logical AND &
% or - Logical OR |
% not - Logical NOT ~
% xor - Logical EXCLUSIVE OR
% any - True if any element of vector is nonzero
% all - True if all elements of vector are nonzero

%% SCRIPTS Y FUNCIONES

% CREAR FUNCION SUMA DE TRES ELEMENTOS, TIPO UINT8, Y COMPROBAR SU
% FUNCIONAMIENTO. GUARDA LA FUNCION EN UN DIRECTORIO LLAMADO funciones, y
% añade el path de este directorio para llamarla

addpath('funciones')
A = funcion_suma(2,3,4)

A = funcion_suma(200,300,400)
rmpath('funciones')


%% EJERCICIOS PROPUESTOS

% Ejercicio1: 
% a) Crea un vector V de 10 elementos con números aleatorios enteros entre 0 y 10.
numElem = 10;
valorRef = 5;
V = round(10*rand(1,numElem));

% b) Genera un vector binario donde el 1 binario señala a los elementos
% del vector que son menores o iguales a 5.
Vb = false(1, numElem);

for i = 1:numElem
    if V(i) < valorRef
        Vb(i) = true;
    end
end

% Vb = V <= valorRef % y no hace falta inicializar el vector

% c) Encuentra con la función find las posiciones en el vector de esos elementos

find(Vb == true);

% d) Encuentra la posición del valor máximo de V

find(V == max(V));

[VMax, ind] = max(V);

% e) Ordena los elmentos del vector, de mayor a menor, obteniendo las
% posiciones donde se encuentran en V

V_ord = zeros(1, numElem);
V_aux = V;

for i = 1:numElem
    V_ord(i) = max(V);
    aux = find(V == max(V));
    
    V(aux(1)) = [];
    
end

sort(V, 'descend')

% Ejercicio2: 
% a) Crea una matriz M de 2 filas y 3 columnas con números enteros aleatorios
% entre 0 y 10.
nfilas = 2;
ncolumnas = 3;
numElem = 10;
vref_1 = 3;
vref_2 = 8;

M = round(numElem*rand(nfilas,ncolumnas));

% b) Genera una matriz binaria de las mismas dimensiones, que indique los 
% valores en M que tienen valores entre 3 y 8

Mb = false(nfilas, ncolumnas);

% Mb = false(size(M))

for i = 1:nfilas
    for j = 1:ncolumnas
        valor = M(i,j);
        if valor > vref_1 && valor < vref_2
            Mb(i,j) = true;
        end
    end
end

% c) Calcula la media de esos elementos

% media = median(median(M));
suma = [];

for i = 1:nfilas
    for j = 1:ncolumnas
        valor = M(i,j);
        if valor > vref_1 && valor < vref_2
            suma(end + 1) = valor;
        end
    end
end

median(suma);

% d) Reemplaza el valor de esos elementos, asignándoles un valor -1
for i = 1:nfilas
    for j = 1:ncolumnas
        valor = M(i,j);
        if valor > vref_1 && valor < vref_2
            M(i,j) = -1
        end
    end
end

% OBSERVACIÓN: 
% LOS EJERCICIOS 1 Y 2 SE DEBEN HACER DE DOS FORMAS:
% 1.- PRACTICANDO PROGRAMACIÓN BUCLE FOR Y SENTENCIA IF
% 2.- UTILIZANDO PROGRAMACIÓN MATRICIAL DE MATLAB


% Ejercicio3:
% a) Genera dos matrices A y B, 5x5, de números enteros aleatorios entre 0 y 10
nfilas = 5;
ncolumnas = 5;
numElem = 10;

A = round(numElem*rand(nfilas,ncolumnas));
% A = 1 + round(8*rand(nfilas,ncolumnas)); entre 1 y 9
B = round(numElem*rand(nfilas,ncolumnas));

% b) Calcula la media de los valores de A en aquellos puntos donde B es > 5
vref = 5;
suma = [];

for i = 1:nfilas
    for j = 1:ncolumnas
        valor = B(i,j);
        if valor > vref
            suma(end +1) = A(i,j);
        end
    end
end

median(suma);

% Ejercicio4:
% a) Generar una matriz A, 10x10, de números enteros aleatorios entre 0 y 5 
nfilas = 10;
ncolumnas = 10;
numElem = 5;

A = round(numElem*rand(nfilas,ncolumnas));
% b) Guarda en un vector fila, llamado valoresA, los valores distintos
% que aparecen en A 
valoresA = unique(A)';

% c) Inicializa con ceros un vector fila, llamado conteoValores,
% de tantos elementos como valores distintos haya en A
conteoValores = zeros(1,length(valoresA));

% d) Guarda en las posiciones de conteoValores el número de veces que
% aparece en A cada uno de sus posiles valores
conteoValores = histc(A(:), valoresA);

% e) Representa con stem, valoresA frente a conteoValores
stem(valoresA, conteoValores);




% Ejercicio5:

M1 = uint8([0;1]);
M2 = uint8([2;1]);

funcion_compara_matrices(M1,M2)


% Observación: si las matrices no tienen la misma dimensión la función
% únicamente debe advertir por el command window este hecho (para ello,
% puedes utilizar la función display('cadena de texto a mostrar').

% Guardar la función en un directorio llamado funciones, y, añadiendo el
% path a este directorio, llámala en distintas situaciones para comprobar
% su correcto funcionamiento.

