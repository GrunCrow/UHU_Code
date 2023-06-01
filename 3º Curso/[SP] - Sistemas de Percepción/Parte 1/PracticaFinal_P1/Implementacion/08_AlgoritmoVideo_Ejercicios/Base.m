%% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

% 
% Carga la información de datosMultiplesEsferas_Clasificador y el numPíx.
% 
% 
% Requiere solo el vídeo y un script que lea el vídeo y le aplique el
% clasificador a cada frame del vídeo.
% 
% Por cada frame llama a calcula_deteccion_multiples_esferas_en_imagen y a
% la funcion_visualiza con la imagen binaria generada anteriormente.
% 
% Por cada frame llama a calcula_deteccion_multiples_esferas_en_imagen,
% eliminar las agrupaciones menores que numPix con vwareaopen.
% 
% Una vez tenemos la imagen binaria podemos aplicarle cualquier algoritmo
% como calcula_centroides o funcion_visualiza.
% 
% Ver todos los centroides, el de la agrupación mayor, color AND movimiento(Practica3.m)...
% 

%% Constantes y parametros

% Definir la ruta donde se encuentran los archivos necesarios
pathsArchivos = "PracticaFinal_P1\Implementacion\08_AlgoritmoVideo_Ejercicios\";

% Cargar los datos requeridos para la detección de objetos
fichero = 'VariablesRequeridas\parametros_clasificador.mat';
load(pathsArchivos + fichero);

% Cargar el video que se va a procesar
fichero = 'VariablesRequeridas\VideoSeguimiento.avi';
video = VideoReader(pathsArchivos + fichero);

% Constantes
rojo = [255 0 0];
verde = [0 255 0];
azul = [0 0 255];

% Tamaño pixel
tam_pixel = 20;
tam_pixel_red = floor(tam_pixel/2);

% Obtener información del video
get(video);

% Añadir la ruta de las funciones que se van a utilizar
addpath(pathsArchivos + 'Funciones');


%% Detección Objeto Por Color

% Crear un objeto para guardar el video procesado
output = VideoWriter('Deteccion.mp4', 'MPEG-4');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;
for i=1:video.NumFrames
    % Leer el frame actual del video
    I = readFrame(video);
    
    % Realizar la detección de las esferas en la imagen
    Ib_multiples_esferas = calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas(:,4),datosMultiplesEsferas(:,1:3));
    Ib = bwareaopen(Ib_multiples_esferas, numPix);
    
    % Visualizar la imagen con las detecciones
    Io = funcion_visualiza(I, Ib, rojo, false);
    imshow(Io);
    
    % Guardar el frame procesado en el archivo de video
    writeVideo(output,Io);
end

% Cerrar el archivo de video
close(output);





%% Detección de Objeto por Color - Centroide
% Cargar el video que se va a procesar
fichero = 'VariablesRequeridas\VideoSeguimiento.avi';
video = VideoReader(pathsArchivos + fichero);

% Obtener información del video
get(video);

% Crear un objeto para guardar el video procesado
output = VideoWriter('Deteccion_Centroide.avi', 'MPEG-4');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;
for i=1:video.NumFrames
    % Leer el frame actual del video
    I = readFrame(video);
    
    % Realizar la detección de las esferas en la imagen
    Ib_multiples_esferas = calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas(:,4),datosMultiplesEsferas(:,1:3));
    Ib = bwareaopen(Ib_multiples_esferas, numPix);
    
    % Calcular las propiedades de las regiones detectadas
    stats = regionprops(Ib,'Area','Centroid'); 
    centroids = cat(1,stats.Centroid);
    areas = cat(1,stats.Area);

    % Si se detectó algún objeto, se marca el centroide y se visualiza la imagen
    if(~isempty(centroids))
        % Seleccionamos el objeto con mayor área detectado
        [~,pos] = max(areas);
        % Obtenemos las coordenadas del centroide del objeto seleccionado
        x = round(centroids(pos,2));
        y = round(centroids(pos,1));
        % Creamos una imagen binaria del tamaño de la imagen original
        Ibcent = zeros(size(I,1),size(I,2));
        % Marcamos una región de 3x3 píxeles centrada en el centroide del objeto
        Ibcent(x-tam_pixel_red:x+tam_pixel_red,y-tam_pixel_red:y+tam_pixel_red) = 1;
        % Visualizamos la imagen original con el objeto marcado en rojo
        Io = funcion_visualiza(I,Ibcent & Ib,[255 0 0], false);

    % Si no se detectó ningún objeto, se marca un área predefinida y se visualiza la imagens
    else
        % Creamos una imagen binaria del tamaño de la imagen original
        Ibcent = zeros(size(I,1),size(I,2));
        % Marcamos una región predefinida de 3x3 píxeles en la esquina superior izquierda
        Ibcent(1:tam_pixel,1:tam_pixel) = 1;
        % Visualizamos la imagen original con el área marcada en rojo
        Io = funcion_visualiza(I,Ibcent & Ib,rojo, false);
    end
    
    % Mostramos la imagen resultante con el objeto o área marcados y mantenemos la figura abierta
    imshow(Io), hold on;
    % Escribimos la imagen en el archivo de video
    writeVideo(output,Io);

end

% Cierra el objeto de video creado en la sección anterior
close(output);


% Detiene la captura de video y vacía los datos almacenados en el objeto de video
stop(video);
flushdata(video);

% Quita el directorio de funciones del path
rmpath(pathsArchivos + 'Funciones');