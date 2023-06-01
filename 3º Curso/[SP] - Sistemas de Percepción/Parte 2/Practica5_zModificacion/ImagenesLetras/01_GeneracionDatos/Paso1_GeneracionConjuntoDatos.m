clc
clear all

pathMain = "Parte 2/Practica5_ReconocimientoFormasGeométricas/";

pathArchivos = pathMain + "MaterialFacilitado/"

pathMain = "Parte 2/PruebaFinal/";

addpath(pathMain + "Funciones");

addpath(pathArchivos + 'ImagenesPractica5/Entrenamiento');

%% 1.0 Lectura Automática de Imágenes
nombres{1}='Circulo'; % 1
nombres{2} = 'Cuadrado'; % 2
nombres{3} = 'Triangulo'; % 3

numClases = 3;
numImagenesPorClase = 2;

for i=1:numClases
    for j=1:numImagenesPorClase
        % 02d para incluir el numero str que se almacena en j
        nombreImagen = [nombres{i} num2str(j,'%02d') '.jpg']
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
        nombreImagen = [nombres{i} num2str(j,'%02d') '.jpg'];
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

nombreClases{1} = 'Circulo';
nombreClases{2} = 'Cuadrado';
nombreClases{3} = 'Triangulo';

% simboloClases: simbolos y colores para representar las muestras de cada clase
simbolosClases{1} = '*r';
simbolosClases{2} = '*g';
simbolosClases{3} = '*b';


% ------------------------------------
% nombresProblema = [];

nombresProblema = [];
nombresProblema.descriptores = nombreDescriptores;
nombresProblema.clases = nombreClases;
nombresProblema.simbolos = simbolosClases;


save(pathMain + 'DatosGenerados/ConjuntoDatosXY.mat','X','Y');
save(pathMain + 'DatosGenerados/nombresProblema','nombresProblema');

rmpath(pathMain + 'ImagenesPractica5/Entrenamiento')
rmpath(pathMain + 'Funciones/');