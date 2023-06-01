% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

%% Detección de Objeto por Color y Centroide

% Definir la ruta donde se encuentran los archivos necesarios
pathsArchivos = "PracticaFinal_P1\Implementacion\08_AlgoritmoVideo_ColorMin\";

% Cargar los datos requeridos para la detección de objetos
fichero = 'VariablesRequeridas\parametros_clasificador.mat';
load(pathsArchivos + fichero);

% Cargar el video que se va a procesar
fichero = 'VariablesRequeridas\video_entrada.avi';
video = VideoReader(pathsArchivos + fichero);

% Añadir la ruta de las funciones que se van a utilizar
addpath(pathsArchivos + 'Funciones');

% Constantes
rojo = [255 0 0];
verde = [0 255 0];
azul = [0 0 255];

% Obtener información del video
get(video);

% Crear un objeto para guardar el video procesado
% output = VideoWriter(pathsArchivos + 'VariablesGeneradas\Deteccion_Centroide.avi', 'MPEG-4');
output = VideoWriter(pathsArchivos + 'VariablesGeneradas\Deteccion_Centroide.avi', 'Uncompressed AVI');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;
for i=1:video.NumFrames
    % Leer el frame actual del video
    I = readFrame(video);
    
    % Realizar la detección de las esferas en la imagen
    Ib_multiples_esferas = calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas_clasificador(:,4),datosMultiplesEsferas_clasificador(:,1:3));
%     Ib = bwareaopen(Ib_multiples_esferas, numPix);
    Ib = funcion_bwareaopen(Ib_multiples_esferas, numPix);
    
    % Calcular las propiedades de las regiones detectadas
%     stats = regionprops(Ib,'Area','Centroid'); 
%     centroids = cat(1,stats.Centroid);
%     areas = cat(1,stats.Area);
    [Ietiq, N] = funcion_bwlabel(Ib);
    centroids = funcion_regionprops_centroid(Ietiq, N);
    areas = funcion_regionprops_area(Ietiq, N);

    % Si se detectó algún objeto, se marca el centroide y se visualiza la imagen
    if(~isempty(centroids))
        % Seleccionamos el objeto con MENOR área detectado
        % [~,pos] = max(areas);
        [~,pos] = min(areas);
        
        % Obtenemos las coordenadas del centroide del objeto seleccionado
        x = round(centroids(pos,2));
        y = round(centroids(pos,1));

        % Creamos una imagen binaria del tamaño de la imagen original
        Ibcent = zeros(size(I,1),size(I,2));

        % Marcamos una región de 3x3 píxeles centrada en el centroide del objeto
        Ibcent(x-1:x+1,y-1:y+1) = 1;
        
        % Visualizamos la imagen original con el objeto marcado en rojo
        Io = funcion_visualiza(I,Ibcent & Ietiq == N(pos), azul, false);

    % Si no se detectó ningún objeto, se marca un área predefinida y se
    % visualiza la imagen -> no hay centroide
    else
        % Creamos una imagen binaria del tamaño de la imagen original
        Ibcent = zeros(size(I,1),size(I,2));
        
        % Marcamos una región predefinida de 3x3 píxeles en la esquina superior izquierda
        Ibcent(1:3,1:3) = 1;
        
        % Visualizamos la imagen original con el área marcada en rojo
        Io = funcion_visualiza(I,Ibcent & Ietiq == N(pos), azul, false);
    end
    
    % Mostramos la imagen resultante con el objeto o área marcados y mantenemos la figura abierta
    imshow(Io);
    % Escribimos la imagen en el archivo de video
    writeVideo(output,Io);

end

% Cierra el objeto de video creado en la sección anterior
close(output);

% Quita el directorio de funciones del path
rmpath(pathsArchivos + 'Funciones');