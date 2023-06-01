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
umbral_inferior = 100;
umbral_superior = 150;

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
    
    Ib_multiples_esferas = calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas(:,4),datosMultiplesEsferas(:,1:3));

    Io = funcion_visualiza(I, Ib_intensidad & Ib_multiples_esferas, rojo, false);

    imshow(Io);

    writeVideo(output,Io);

end

% Cierra el objeto de video
close(output);