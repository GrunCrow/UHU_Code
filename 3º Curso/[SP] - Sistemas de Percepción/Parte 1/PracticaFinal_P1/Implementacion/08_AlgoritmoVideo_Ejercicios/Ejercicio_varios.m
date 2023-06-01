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