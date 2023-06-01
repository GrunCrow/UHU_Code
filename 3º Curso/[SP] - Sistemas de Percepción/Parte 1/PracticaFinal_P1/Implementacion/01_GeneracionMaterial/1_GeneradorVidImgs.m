% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

% Establecer la ruta base donde se encuentran las variables generadas
basePath = "PracticaFinal_P1/Implementacion/01_GeneracionMaterial/VariablesGeneradas/";

% Establecer el nombre base del objeto
baseName_Objeto = 'img_Objeto';



%% Generación de Vídeo de Seguimiento
% Se establece que se pueden utilizar todos los recursos disponibles de la memoria.
imaqmex('feature','-limitPhysicalMemoryUsage',false);
% Se crea el objeto para capturar el video
video = videoinput('winvideo',1,'MJPG_320x240');
% Se muestra la vista previa del video capturado
preview(video);
% Se establece que la captura de fotogramas se repita indefinidamente
video.TriggerRepeat = inf;
% Se establece el intervalo en que se grabarán los fotogramas del video
video.FrameGrabInterval=1;
% Se establece la tasa de fotogramas máxima para la cámara web
fpsMaxWebCam = 15;
% Se calcula la tasa de fotogramas a utilizar en el trabajo
fpsTrabajoWebCam = fpsMaxWebCam/video.FrameGrabInterval;

% Se establece que se guarde el registro de memoria
set(video,'LoggingMode','memory')

% Se crea un objeto de video comprimido sin pérdidas
aviobjIN = VideoWriter(basePath + 'VideoSeguimiento.avi','Uncompressed AVI');

% Se establece la tasa de fotogramas del objeto de video
aviobjIN.FrameRate = fpsTrabajoWebCam;
aviobjOUT.FrameRate = fpsTrabajoWebCam;

% Se establece la duración de la grabación
duracion = 15;
% Se calcula el número de fotogramas que se capturarán
numFramesGrabacionIN = duracion*aviobjIN.FrameRate;
% Se abre el objeto de video de entrada
open(aviobjIN);
% Se inicia la grabación de video
start(video);

% Se capturan los fotogramas de video hasta que se alcance el número de fotogramas establecido
while(video.FramesAcquired<numFramesGrabacionIN)
    % Se captura un fotograma del video
    I = getdata(video,1);
    % Se escribe el fotograma capturado en el archivo de video de entrada
    writeVideo(aviobjIN,I);
end

% Se detiene la grabación de video
stop(video)

% Se cierra el archivo de video de entrada
close(aviobjIN);







%% IMGs Calibración

%% Generación de Imágenes de Calibración
% Se establece el número de repeticiones de la captura de imágenes de calibración
num_Repeticiones = 10;
% Se crea un array para almacenar las imágenes de calibración sin objeto
Imagenes_Calibracion_SinObjeto = uint8(zeros(240, 320, 3, num_Repeticiones));
% Se crea un array para almacenar las imágenes de calibración con objeto
Imagenes_Calibracion_ConObjeto = uint8(zeros(240, 320, 3, num_Repeticiones));

% Se muestra la vista previa del video capturado
preview(video)



% Generación de imágenes de calibración SIN objeto
start(video) % Inicia la adquisición de imágenes de la cámara
for i=1:num_Repeticiones
    pause; % Pausa el loop para permitir al usuario colocar el objeto
    I = getsnapshot(video); % Toma una imagen de la cámara
    filename = strcat(basePath + strcat("sinObjeto"), num2str(i), '.jpg'); % Genera el nombre del archivo
    imwrite(I, filename); % Guarda la imagen en el archivo
    Imagenes_Calibracion_SinObjeto(:,:,:,i) = I; % Almacena la imagen en el arreglo de imágenes sin objeto
end
stop(video) % Detiene la adquisición de imágenes de la cámara



% Generación de imágenes de calibración CON objeto
start(video) % Inicia la adquisición de imágenes de la cámara
preview(video) % Muestra la imagen de la cámara en vivo
for i=1:num_Repeticiones
    pause; % Pausa el loop para permitir al usuario quitar el objeto
    I = getsnapshot(video); % Toma una imagen de la cámara
    filename = strcat(basePath + strcat("conObjeto"), num2str(i), '.jpg'); % Genera el nombre del archivo
    imwrite(I, filename); % Guarda la imagen en el archivo
    Imagenes_Calibracion_ConObjeto(:,:,:,i) = I; % Almacena la imagen en el arreglo de imágenes con objeto
end
stop(video) % Detiene la adquisición de imágenes de la cámara

% Visualización de las imágenes de calibración sin objeto
for i=1:num_Repeticiones
    subplot(1,2,1), imshow(Imagenes_Calibracion_SinObjeto(:,:,:,i)), title("Imagen " + i); hold on % Muestra la imagen en la ventana de la figura
    pause; % Pausa el loop para permitir al usuario examinar la imagen
end
close all; % Cierra todas las ventanas de la figura

% Visualización de las imágenes de calibración con objeto
close all; % Cierra todas las ventanas de la figura
for i=1:num_Repeticiones
    subplot(1,2,1), imshow(Imagenes_Calibracion_ConObjeto(:,:,:,i)), title("Imagen " + i); hold on % Muestra la imagen en la ventana de la figura
    pause; % Pausa el loop para permitir al usuario examinar la imagen
end
close all; % Cierra todas las ventanas de la figura

% Guarda las imágenes de calibración en un archivo .mat
save(basePath + 'ImagenesCalibracion.mat',"Imagenes_Calibracion_ConObjeto","Imagenes_Calibracion_SinObjeto");