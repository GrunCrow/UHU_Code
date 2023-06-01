%% Generación de Vídeo de Seguimiento

% Paths
pathsArchivos = "PracticaFinal_P1/Implementacion/01_GeneracionMaterial/VariablesGeneradas/";
nombreconObjeto = "ImagenesCalibracionCon.mat";
nombresinObjeto = "ImagenesCalibracionSin.mat";

% Establecer configuracion
imaqmex('feature','-limitPhysicalMemoryUsage',false);
video = videoinput('winvideo',1,'MJPG_320x240');
preview(video);
set(video.Parent, 'Name', 'Video con Objeto');
video.TriggerRepeat = inf;
video.FrameGrabInterval=1;
fpsMaxWebCam = 30;
fpsTrabajoWebCam = fpsMaxWebCam/video.FrameGrabInterval;

set(video,'LoggingMode','memory')

% Creación archivo de vídeo.
aviobjIN = VideoWriter(pathsArchivos + 'VideoSeguimiento.avi','Uncompressed AVI');
aviobjIN.FrameRate = fpsTrabajoWebCam;
aviobjOUT.FrameRate = fpsTrabajoWebCam;

duracion = 15;
numFramesGrabacionIN = duracion*aviobjIN.FrameRate;

open(aviobjIN);
start(video);
while(video.FramesAcquired<numFramesGrabacionIN)
    I = getdata(video,1);
    writeVideo(aviobjIN,I);
end
stop(video);
close all
close(aviobjIN);


%% Generación de Imágenes de Calibración

% Parametros
num_Repeticiones = 10;
Imagenes_Calibracion_SinObjeto = uint8(zeros(240,320,3,num_Repeticiones));
Imagenes_Calibracion_Color = uint8(zeros(240,320,3,num_Repeticiones));

% Imagenes Sin Objetos
pathImagenesSinObjetos = strcat(pathsArchivos + "Imagenes\img_SinObjeto_");
preview(video)
start(video)
for counter=1:num_Repeticiones
    set(video.Parent, 'Name', 'Captura de Imagen sin Objeto: ' + num2str(counter));
    pause; % enter para capturar
    img = getsnapshot(video);
    filename = strcat(pathImagenesSinObjetos, num2str(counter), '.jpg');
    imwrite(img, filename);
    Imagenes_Calibracion_SinObjeto(:,:,:,counter) = img;
end
stop(video)

% Captura de Imagenes con Objeto
start(video)
preview(video)
pathImagenesSinObjetos = strcat(pathsArchivos + "Imagenes\img_ConObjeto_");

for counter=1:num_Repeticiones
    set(video.Parent, 'Name', 'Captura de Imagen con Objeto: ' + num2str(counter));
    pause;
    img = getsnapshot(video);
    filename = strcat(pathImagenesConObjetos, num2str(counter), '.jpg');
    imwrite(img, filename);
    Imagenes_Calibracion_Color(:,:,:,counter) = img;
end
stop(video)


% Visualizar Imagenes: 1º sin objeto
for i=1:num_Repeticiones
    subplot(1,2,1), imshow(Imagenes_Calibracion_SinObjeto(:,:,:,i)), title("Imagen sin objeto" + i); hold on
    pause;
end
close all;

% 2º con objeto
close all;
for i=1:num_Repeticiones
    subplot(1,2,1), imshow(Imagenes_Calibracion_Color(:,:,:,i)), title("Imagen con objeto" + i); hold on
    pause;
end
close all;



save('./VariablesGeneradas/ImagenesCalibracion.mat',"Imagenes_Calibracion_Color","Imagenes_Calibracion_SinObjeto");