% 1. Leer las imagenes de calibración y aplicarle el clasificador del
% apartado 3).
% 
% 2. Decidir el radio de las esferas. 
%    (He elegido el primer radio porque es el que más se ajusta a las 
%       imágenes de calibración).
% 
%   
%
% 3. Usar vwareaopen() para filtrar las agrupaciones de píxeles menores del
% fondo. Hay que tener en cuenta la agrupación mínima de píxeles. Para
% ello:
% 
% En la imágen más alejada calcular los números de píxeles con roipoly y
% hacer un sum de esa imagen binaria. (1)
% 
%   Tendremos en cuenta el 25%, 50% y el 75% de esos píxeles.
%   (numPixelesAnalisis)
% 
% 
% 4. Guardar el numero de píxeles mínimo y el datosMultiplesEsferas.
% 


% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

% Definir la ruta del directorio donde se encuentran los archivos
pathsArchivos = "PracticaFinal_P1\Implementacion\04_AjusteClasificador_ImgCalib\";

% Cargar el archivo de imágenes de calibración
fichero = 'VariablesRequeridas\ImagenesCalibracion.mat';
load(pathsArchivos + fichero);

% Cargar el archivo de datos de múltiples esferas
fichero = 'VariablesRequeridas\datosMultiplesEsferas.mat';
load(pathsArchivos + fichero);

% Añadir la ruta de las funciones a la ruta de búsqueda de MATLAB
addpath(pathsArchivos + 'Funciones');

% 1. Leer las imágenes de calibración y aplicar el clasificador del apartado 3)
% Definir umbral de distancia como el primer radio de la esfera en datosEsferas
for j=1:size(Imagenes_Calibracion_ConObjeto(),4)
    % Mostrar la j-ésima imagen del conjunto
    figure, I = Imagenes_Calibracion_ConObjeto(:,:,:,j);
    subplot(2,2,1)
    imshow(I);
    title(["Imagen Original" num2str(j)])
    
    % Iterar sobre cada esfera en datosEsferas y visualizarla en la imagen original
    for i=1:size(datosEsferas(:,1:3),2)
        % Detectar la i-ésima esfera en la imagen original y visualizarla
        I1 = funcion_visualiza(I,calcula_deteccion_multiples_esferas_en_imagen(I,datosEsferas(:,3+i),datosEsferas(:,1:3)),[255 0 0],false);
        subplot(2,2,i+1)
        imshow(I1), hold on;
        % Mostrar el radio de la esfera como título de la subfigura
        % (comentado porque parece haber un error en la variable)
%         title(['Esfera de radio: ' num2str(datosEsferas(:,1))])
    end
end

% En la imagen más alejada calcular los números de píxeles con roipoly y
% hacer un sum de esa imagen binaria. (1)
I_numPix_min = roipoly(Imagenes_Calibracion_ConObjeto(:,:,:,1));
% Agrupacion de píxeles mínima.
numPix = sum(I_numPix_min,"all"); 
porcentajesPixeles = round([numPix * .25, numPix * .50, numPix * .75]);



%% Filtrar las agrupaciones de píxeles menores del fondo

% Este bucle recorre las imágenes del conjunto de calibración con objeto
for j=1:size(Imagenes_Calibracion_ConObjeto(),4)

    % Seleccionar la imagen actual del conjunto
    figure, I = Imagenes_Calibracion_ConObjeto(:,:,:,j);
    
    % Detectar las esferas en la imagen actual usando sus datos de radio y posición
    Ib_deteccion_distancia = calcula_deteccion_multiples_esferas_en_imagen(I,datosEsferas(:,4),datosEsferas(:,1:3));
    
    % Visualizar la imagen actual y las esferas detectadas en rojo
    Io = funcion_visualiza(I,Ib_deteccion_distancia,[255 0 0], false);
    subplot(2,2,1), imshow(Io);
    
     % Este bucle itera a través de diferentes porcentajes de área de la esfera
    for i=1:length(porcentajesPixeles)
        % Detectar las esferas en la imagen actual usando sus datos de radio y posición, y eliminando las esferas que tienen menos del porcentaje especificado de área
        Ib_new = bwareaopen(calcula_deteccion_multiples_esferas_en_imagen(I,datosEsferas(:,4),datosEsferas(:,1:3)),porcentajesPixeles(i));
        Io = funcion_visualiza(I,Ib_new,[255 0 0],false);
        subplot(2,2,i+1)
        imshow(Io), hold on;
%         title(['Esfera de radio: ' num2str(datosEsferas(:,1))])
    end
    
    % Se muestra la original, al 25, 50 y 75%

    pause;
    close all;
end


datosMultiplesEsferas = datosEsferas;
numPix = porcentajesPixeles(3);

% Se guarda en un archivo
save(pathsArchivos + 'VariablesGeneradas\parametros_clasificador.mat',"numPix","datosMultiplesEsferas");
% Se elimina el path del directorio "Funciones"
rmpath(pathsArchivos + 'Funciones');