% GUARDA EN LA VARIABLE I1, UNA MATRIZ DE 40 FILAS Y 80 COLUMNAS
% CON NÚMEROS ALEATORIOS ENTEROS ENTRE 0 Y 255, TIPO UINT8 

I1 = uint8(255*rand(40,80))


% MUESTRA LA INFORMACIÓN COMO UNA IMAGEN
imshow(I1)

figure, imshow(I1/255) % todo negro porq los valores entre 0 y 1 y entoces es casi negro todo, apenas percibible
figure, imshow(double(I1)/255) % al ser double tiene decimales, entonces se normaliza la entrada -> todo entre 0 y 1 con decimales, asi esta todo entre 0 y 1
% si se le pasan valores doubles pero hay valores mayores que 1, entonces
% lo truncará y lo mayor de 1 será = 1 (que seria como 255 = blanco)


% si un color es blanco y negro entonces R G Y B estaran igualados, el
% mismo valor, si ningun valor se impone, es blanco y negro, en el momento
% en el que uno de los valores destaque, entonces se verá un color

% blanco y negro NO -> escala de grises

% GUARDA EN LA VARIABLE I2, TRES MATRICES DE 40 FILAS Y 80 COLUMNAS 
% CON NÚMEROS ALEATORIOS ENTEROS
% ENTRE 0 Y 255, TIPO UINT8 
I2 = uint8(255*rand(40,80,3));

% MUESTRA LA INFORMACIÓN COMO UNA IMAGEN
figure, imshow(I2)


clear, clc, close all

addpath("P0_ProgramacionBasicaMatlab\P0_2_IniciacionImagenesMatlab\");

% Leer imagenes
I=imread('X.jpg'); % Imagen en escala de grises - ver variable en workspace
Ic = imread('P1_1.jpg'); % Imagen en color

% por como se carga en matlab podemos saber si es escala de grises o no

% GUARDA EN VARIABLES LA DIMENSION DE LAS VARIABLES I, Ic



[NumFilas NumColumnas NumComp] = size (I);
[NumFilas NumColumnas NumComp] = size (Ic);

% Visualizar variables
imshow(I),figure,imshow(Ic)
imtool(I),imtool(Ic) % inspect pixel values y coordenadas

% Acceder al valor de intensidad de coordenadas
close all, imshow(Ic) % MARCAR CUALQUIER PUNTO PARA VER SU INFORMACIÓN
I(3,5) % Fila 3, columna 5
Ic(3,5) % Comprobar que solo hay un valor, ¿que representa ese valor?

Ic(3,5,1) % componente roja
Ic(3,5,2) % componente verde
Ic(3,5,3) % componente azul

% Con imtool(I), obtenemos Pixel info: (141,200) 147
I(200,141)

% Modificar valores

% Poner rectangulo blanco en imagen intensidad
Imod = I;
Imod(100:150,200:400) = 255; 
imshow(I),figure,imshow(Imod)
close all;

% Poner rectangulo azul en imagen color
Ic_mod = Ic;
Ic_mod(100:150,200:400,1:2) = 0;
Ic_mod(100:150,200:400,3) = 255;
imshow(Ic),figure, imshow(Ic_mod)

% Seleccionar una componente de color
Ir = Ic(:,:,1);
Ig = Ic(:,:,2);
Ib = Ic(:,:,3);
imshow(Ic),figure,imshow(Ir),figure,imshow(Ig),figure,imshow(Ib)
close all;


% Operando con imagenes
I(200,300) % Valor 151

% Guarda en una variable el valor de intensidad de ese pixel +10
A = I(200,300) + 10

% Guarda en otra variable el valor de intensidad de ese pixel +105
B = I(200,300) + 105

% ¿Que observas?

% IMPORTANTE: ANTES DE OPERAR CON VALORES DE IMAGENES HAY QUE HACER UNA
% CONVERSION DEL FORMATO DE LOS DATOS - DE UINT8 A DOUBLE

I = double (I);
B = I(200,300) + 105


% Histogramas
I = uint8(I);
imtool(I)

% ¿Cuáles son los posibles valores que puede tener un elemento de la
% matriz?

valores_posibles = 0:255;


% Guarda en las posiciones de un vector llamado  conteoValores
% el número de veces que aparece en I cada uno de sus posiles valores.
% Para ello utiliza la función de matlab imhist
% Representa con stem la información de conteoValores

I=imread('X.jpg'); % Imagen en escala de grises - ver variable en workspace

conteoValores = imhist(I);

% Accede al numero de pixeles que hay en I con un nivel de gris 128
conteoValores(128+1)

% Representacion histograma con imhist
imshow(I), figure,imhist(I)

% Representación histograma con stem

stem (valores_posibles, conteoValores, '.r'), hold on, imhist(I)



% EJEMPLO BASICO DE PROCESAMIENTO: SEGMENTAR TODOS LOS PIXELES
% PERTENECIENTES A LETRAS X EN IMAGEN I
% CREAR UNA IMAGEN BINARIA QUE LOCALICE 


[N M] = size(I);

Ibin = double(N,M);

for i=1:N
    for j=1:M
        if I(i,j) < 100
            Ibin(i,j) = 1;
        end
    end
end

% PROGRAMACION MAS EFICAZ: 
Ibin = I < 100; % datos tipo logico
Ibin = double(I<100); % para tenerlos tipo double como antes

% Visualiza la informacion
imshow(uint8(Ibin));

imshow(uint8(255*Ibin));

% GUARDAR LA INFORMACION
save ImagenSegmentada I Ibin
imwrite(uint8(255*Ibin),'ImagenBinaria.tif');



