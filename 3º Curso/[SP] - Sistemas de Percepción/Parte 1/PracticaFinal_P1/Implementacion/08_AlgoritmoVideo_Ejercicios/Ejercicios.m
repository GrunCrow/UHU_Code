% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

%% Parámetros y constantes

% Definir la ruta donde se encuentran los archivos necesarios
pathsArchivos = "PracticaFinal_P1\Implementacion\08_AlgoritmoVideo_Ejercicios\";

% Cargar los datos requeridos para la detección de objetos
fichero = 'VariablesRequeridas\parametros_clasificador.mat';
load(pathsArchivos + fichero);

% Cargar el video que se va a procesar
fichero = 'VariablesRequeridas\VideoSeguimiento.avi';
video = VideoReader(pathsArchivos + fichero);

% Añadir la ruta de las funciones que se van a utilizar
addpath(pathsArchivos + 'Funciones');

% Constantes
rojo = [255 0 0];
verde = [0 255 0];
azul = [0 0 255];

% Obtener información del video
get(video);





%% Intensidad

% Crear un objeto para guardar el video procesado
output = VideoWriter(pathsArchivos + 'VariablesGeneradas\Intensidad.avi', 'Uncompressed AVI');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;

% Establecer umbrales de intensidad
umbral_inferior = 85;
umbral_superior = 115;

% Para cada frame del video
for i=1:video.NumFrames
    % Lee frame actual
    I = readFrame(video);
    
    % Representa los píxeles con una Intensidad entre 85 y 115
    % Calcula media de la intensidad de los 3 canales
    Iintensidad = uint8(mean(I,3));
    % Visualiza, aquellos pixeles que se encuentren entre los umbrales
    % establecidos se mostraran del color introducido (rojo)
    Ib_intensidad = Iintensidad > umbral_inferior & Iintensidad < umbral_superior;
    Io = funcion_visualiza(I, Ib_intesidad,rojo, false);

    imshow(Io);

    writeVideo(output,Io);

end

% Cierra el objeto de video
close(output);




%% Movimiento

% Crear un objeto para guardar el video procesado
output = VideoWriter(pathsArchivos + 'VariablesGeneradas\Movimiento.avi', 'Uncompressed AVI');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;

% Establecer umbral de movimiento
umbral_movimiento = 30;

% Guardar frame anterior para comparar pixeles con el frame presente
frame_anterior = readFrame(video);
% Imagen intensidad del frame anterior
Iintensidad_frame_anterior = uint8(mean(frame_anterior,3));

% Para cada frame del video
% Empieza en 2 porque sino no puede comparar con el frame anterior
for i=2:video.NumFrames
    % Lee frame actual
    I = readFrame(video);

    % Calcula media de la intensidad de los 3 canales
    Iintensidad = uint8(mean(I,3));

    % Visualiza, aquellos pixeles que se encuentren entre los umbrales
    % establecidos se mostraran del color introducido (rojo)
    Ib_movimiento = imabsdiff(Iintensidad_frame_anterior, Iintensidad) > umbral_movimiento;
    Io = funcion_visualiza(I, Ib_movimiento, verde, false);

    imshow(Io);

    writeVideo(output,Io);

    % Actualizar frame anterior
    % Guardar frame anterior para comparar pixeles con el frame presente
    frame_anterior = I;
    % Intensidad del frame anterior
    Iintensidad_frame_anterior = uint8(mean(frame_anterior,3));

end

% Cierra el objeto de video
close(output);




%% Intensidad + Movimiento

% Crear un objeto para guardar el video procesado
output = VideoWriter(pathsArchivos + 'VariablesGeneradas\Intensidad_Movimiento.avi', 'Uncompressed AVI');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;

% Establecer umbrales de intensidad
umbral_inferior = 85;
umbral_superior = 115;

% Establecer umbral de movimiento
umbral_movimiento = 30;

% Guardar frame anterior para comparar pixeles con el frame presente
frame_anterior = readFrame(video);
% Imagen intensidad del frame anterior
Iintensidad_frame_anterior = uint8(mean(frame_anterior,3));

% Para cada frame del video
% Empieza en 2 porque sino no puede comparar con el frame anterior
for i=2:video.NumFrames
    % Lee frame actual
    I = readFrame(video);

    % Calcula media de la intensidad de los 3 canales
    Iintensidad = uint8(mean(I,3));

    % Imagen binaria de intensidad
    Ib_intensidad = Iintensidad > umbral_inferior & Iintensidad < umbral_superior;
    
    % Imagen binaria de movimiento
    Ib_movimiento = imabsdiff(Iintensidad_frame_anterior, Iintensidad) > umbral_movimiento;
    
    % Imagen binaria de intensidad y movimiento
    Ib_ambos = Ib_intensidad & Ib_movimiento;
    Io = funcion_visualiza(I, Ib_ambos, azul, false);

    imshow(Io);

    writeVideo(output,Io);

    % Actualizar frame anterior
    % Guardar frame anterior para comparar pixeles con el frame presente
    frame_anterior = I;
    % Intensidad del frame anterior
    Iintensidad_frame_anterior = uint8(mean(frame_anterior,3));

end

% Cierra el objeto de video
close(output);






%% Todo

% Crear un objeto para guardar el video procesado
output = VideoWriter(pathsArchivos + 'VariablesGeneradas\Todo.avi', 'Uncompressed AVI');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;

% Establecer umbrales de intensidad
umbral_inferior = 85;
umbral_superior = 115;

% Establecer umbral de movimiento
umbral_movimiento = 30;

% Guardar frame anterior para comparar pixeles con el frame presente
frame_anterior = readFrame(video);
% Imagen intensidad del frame anterior
Iintensidad_frame_anterior = uint8(mean(frame_anterior,3));

% Para cada frame del video
% Empieza en 2 porque sino no puede comparar con el frame anterior
for i=2:video.NumFrames
    % Lee frame actual
    I = readFrame(video);

    % Calcula media de la intensidad de los 3 canales
    Iintensidad = uint8(mean(I,3));

    % Imagen binaria de intensidad
    Ib_intensidad = Iintensidad > umbral_inferior & Iintensidad < umbral_superior;
    
    % Imagen binaria de movimiento
    Ib_movimiento = imabsdiff(Iintensidad_frame_anterior, Iintensidad) > umbral_movimiento;
    
    % Imagen binaria de intensidad y movimiento
    Ib_ambos = Ib_intensidad & Ib_movimiento;

    % Visualiza Intensidad - rojo
    Io = funcion_visualiza(I, Ib_intensidad, rojo, false);

    % Visualiza movimiento - verde
    Io = funcion_visualiza(Io, Ib_movimiento, verde, false);

    % Visualiza ambos - azul
    Io = funcion_visualiza(Io, Ib_ambos, azul, false);

    imshow(Io);

    writeVideo(output,Io);

    % Actualizar frame anterior
    % Guardar frame anterior para comparar pixeles con el frame presente
    frame_anterior = I;
    % Intensidad del frame anterior
    Iintensidad_frame_anterior = uint8(mean(frame_anterior,3));

end

% Cierra el objeto de video
close(output);




%% "Original" con funciones hechas en clase

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
        % Seleccionamos el objeto con mayor área detectado
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

    % Si no se detectó ningún objeto, se marca un área predefinida y se visualiza la imagens
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