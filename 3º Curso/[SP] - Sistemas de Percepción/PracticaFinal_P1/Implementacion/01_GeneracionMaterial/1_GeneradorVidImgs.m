basePath = "PracticaFinal_P1/Implementacion/01_GeneracionMaterial/VariablesGeneradas/";

baseName_Objeto = 'img_Objeto';

%% Generación de Vídeo de Seguimiento
imaqmex('feature','-limitPhysicalMemoryUsage',false);
video = videoinput('winvideo',1,'MJPG_320x240');
preview(video);
video.TriggerRepeat = inf;
video.FrameGrabInterval=1;
fpsMaxWebCam = 15;
fpsTrabajoWebCam = fpsMaxWebCam/video.FrameGrabInterval;

set(video,'LoggingMode','memory')

% Creación archivo de vídeo.
aviobjIN = VideoWriter(basePath + 'VideoSeguimiento.avi','Uncompressed AVI');
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
stop(video)
close(aviobjIN);







%% IMGS CALIBRACION

%% Generación de Imágenes de Calibración
num_Repeticiones = 10;
Imagenes_Calibracion_SinObjeto = uint8(zeros(240,320,3,num_Repeticiones));
Imagenes_Calibracion_ConObjeto = uint8(zeros(240,320,3,num_Repeticiones));

preview(video)
start(video)
for i=1:num_Repeticiones
    pause;
    I = getsnapshot(video);
    filename = strcat(basePath + strcat("sinObjeto"), num2str(i), '.jpg');
    imwrite(I, filename);
    Imagenes_Calibracion_SinObjeto(:,:,:,i) = I;
end
stop(video)




start(video)
preview(video)
for i=1:num_Repeticiones
    pause;
    I = getsnapshot(video);
    filename = strcat(basePath + strcat("conObjeto"), num2str(i), '.jpg');
    imwrite(I, filename);
    Imagenes_Calibracion_ConObjeto(:,:,:,i) = I;
end
stop(video)




for i=1:num_Repeticiones
    subplot(1,2,1), imshow(Imagenes_Calibracion_SinObjeto(:,:,:,i)), title("Imagen " + i); hold on
    pause;
end
close all;


close all;
for i=1:num_Repeticiones
    subplot(1,2,1), imshow(Imagenes_Calibracion_ConObjeto(:,:,:,i)), title("Imagen " + i); hold on
    pause;
end

close all;


save(basePath + 'ImagenesCalibracion.mat',"Imagenes_Calibracion_ConObjeto","Imagenes_Calibracion_SinObjeto");
