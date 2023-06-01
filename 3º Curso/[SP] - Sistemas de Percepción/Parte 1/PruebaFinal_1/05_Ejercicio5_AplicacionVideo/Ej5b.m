%% EJERCICIO 5b - debe generar 'videoSalidaEj5b.avi'


% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

%% Parámetros y constantes

% Definir la ruta donde se encuentran los archivos necesarios
pathsArchivos = "PruebaFinal_1\05_Ejercicio5_AplicacionVideo\";

% Cargar los datos requeridos para la detección de objetos
fichero = 'datosMultiplesEsferas_clasificador.mat';
load(pathsArchivos + fichero);

% Cargar el video que se va a procesar
fichero = 'videoEntrada.avi';
video = VideoReader(pathsArchivos + fichero);

% Añadir la ruta de las funciones que se van a utilizar
addpath(pathsArchivos + 'Funciones');

% Constantes
rojo = [255 0 0];
verde = [0 255 0];
azul = [0 0 255];
amarillo = [255 255 0];

% Obtener información del video
get(video);


%% Todo

% Crear un objeto para guardar el video procesado
output = VideoWriter(pathsArchivos + 'videoSalidaEj5b.avi', 'Uncompressed AVI');
output.FrameRate = video.FrameRate;
open(output);

% Iniciar el video desde el principio y procesar cada frame
video.CurrentTime = 0;

% Para cada frame del video
for i=1:video.NumFrames
    % Lee frame actual
    I = readFrame(video);

    % Realizar la detección de las esferas en la imagen
    esfera_1 = datosMultiplesEsferas_clasificador(1,:);
    radio_1 = esfera_1(1);
    centroides_1 = esfera_1(1,:);

    esfera_2 = datosMultiplesEsferas_clasificador(2,:);
    radio_2 = esfera_2(1);
    centroides_2 = esfera_2(1,:);

    Ib_esfera_1 = calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas(:,4),datosMultiplesEsferas(:,1:3));
    % Visualizar la imagen con las detecciones esfera 1
    Io = funcion_visualiza(I, Ib_esfera_1, rojo, false);
    imshow(Io);

    % Visualizar la imagen con las detecciones esfera MAYOR
    Io = funcion_visualiza(Io, Ib_esfera_2, amarillo, false);
    imshow(Io);
    
    imshow(Io);
    
    % Guardar el frame procesado en el archivo de video
    writeVideo(output,Io);
end

% Cierra el objeto de video
close(output);