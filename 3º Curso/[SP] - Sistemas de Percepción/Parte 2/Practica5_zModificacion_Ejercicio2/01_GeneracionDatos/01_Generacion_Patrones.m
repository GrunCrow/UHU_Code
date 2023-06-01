clc, clear all, close all

pathImagenes = "ImagenesLetras/";

pathDatosGenerados = ("DatosGenerados/");

addpath("Funciones");

addpath(pathImagenes + 'ImagenesEntrenamiento');

%% 1.0 Lectura Automática de Imágenes
nombres{1}='A'; % 1
nombres{2} = 'B'; % 2
nombres{3} = 'C'; % 3
nombres{4}='D'; % 4
nombres{5} = 'E'; % 5
nombres{6} = 'F'; % 6
nombres{7}='G'; % 7

numClases = 7;
numImagenesPorClase = 2;

% Leer imagenes
for i=1:numClases
    for j=1:numImagenesPorClase
        % 02d para incluir el numero str que se almacena en j
        nombreImagen = [nombres{i} num2str(j,'%2d') '.tif']
        I = imread(nombreImagen);
    end
end


%% 1.1 Binarizar con Metodología de Selección Automáticas de Umbral
%
%   Generar Ibin.
%   Usar las funciones de selección de umbral de histogramas
%   funcion_min_entre_max, funcion_isodata y funcion_otsu.
%
X = []; 
Y = [];


%Lectura automática de imágenes
for i=1:numClases
    for j=1:numImagenesPorClase
        nombreImagen = [nombres{i} num2str(j,'%2d') '.tif'];
        I = imread(nombreImagen);
        umbral = 255*graythresh(I);
        Ib = I < umbral;

    %% 1.2 Eliminación de Componentes Conexas Ruidosas
    %
    %   COMPONENTE RUIDOSA:
    %   COMPONENTES DE MENOS DEL 0.1% DEL NÚMERO TOTAL DE PÍXELES DE LA IMAGEN
    %   O NÚMERO DE PÍXELES MENOR AL AREA DEL OBJETO MAYOR /5
    %   SE DEBE CUMPLIR CUALQUIERA DE LAS DOS CONDICIONES
    %   Para ello, se debe programar la siguiente funcion:
    %       IbinFilt = funcion_elimina_regiones_ruidosas(Ibin);


    IbinFilt = funcion_elimina_regiones_ruidosas(Ib); % llama a bwareaopen = filtraobjetos


    %% 1.3 Etiquetado
    %    Genera matriz etiquetada Ietiq y número N de agrupaciones conexas

    [Ietiq,N] = bwlabel(IbinFilt); 


    %% 1.4 Cálculo de los 23 descriptores de cada agrupación conexa
    %   Genera Ximagen - matriz de N filas y 23 columnas (los 23 descriptores
    %    generados en el orden indicado en la práctica)
    %        XImagen = funcion_calcula_descriptores_imagen(Ietiq,N);


        XImagen = funcion_calcula_descriptores_imagen(Ietiq,N);
        X = [X;XImagen];

    %% 1.5 Generar YImagen
    %   Genera Yimagen - matriz de N filas y 1 columna con la codificación
    %   empleada para la clase a la que pertenecen los objetos de la imagen
       
        Y = [Y;ones(N,1)*i];
    end
end

%% Generar la variable Struct para guardar los nombres del problema.
% nombreDescriptores = {'XXX','XXX', 'XXX', 'XXX', ... HASTA LOS 23};

nombreDescriptores = { 
    'Compacticidad', 
    'Excentricidad', 
    'Solidez_CHull(Solidity)', 
    'Extension_BBox(Extent)', 
    'Extension_BBox(Invariante Rotacion)', 
    'Hu1', 
    'Hu2', 
    'Hu3', 
    'Hu4', 
    'Hu5', 
    'Hu6', 
    'Hu7', 
    'DF1', 
    'DF2', 
    'DF3', 
    'DF4', 
    'DF5', 
    'DF6', 
    'DF7', 
    'DF8', 
    'DF9', 
    'DF10', 
    'NumEuler'};

% nombreClases:
nombreClases{1}='A'; % 1
nombreClases{2} = 'B'; % 2
nombreClases{3} = 'C'; % 3
nombreClases{4}='D'; % 4
nombreClases{5} = 'E'; % 5
nombreClases{6} = 'F'; % 6
nombreClases{7}='G'; % 7

% simboloClases: simbolos y colores para representar las muestras de cada clase
simbolosClases{1} = '*r'; % red
simbolosClases{2} = '*g'; % green
simbolosClases{3} = '*b'; % blue
simbolosClases{4} = '*c'; % cyan
simbolosClases{5} = '*m'; % morado
simbolosClases{6} = '*y'; % yellow
simbolosClases{7} = '*k'; % black
% simbolosClases{3} = '*w'; % white


% ------------------------------------
% nombresProblema = [];

nombresProblema = [];
nombresProblema.descriptores = nombreDescriptores;
nombresProblema.clases = nombreClases;
nombresProblema.simbolos = simbolosClases;


save('DatosGenerados/ConjuntoDatosXY.mat','X','Y');
save('DatosGenerados/nombresProblema','nombresProblema');

rmpath("Funciones");
rmpath(pathImagenes + 'Entrenamiento');