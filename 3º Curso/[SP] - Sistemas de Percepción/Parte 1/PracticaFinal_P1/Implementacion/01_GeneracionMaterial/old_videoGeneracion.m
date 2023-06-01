% Video para hacer un seguimiento de color. Hacerlo con el color rojo, que
% se ponga un recuadro 5x5 en el centro del objeto de color rojo. Con un
% clasificador de pixeles de 10-15 segundos

clear;
video=videoinput('winvideo',1,'MJPG_320x240'); %
set(video, 'LoggingMode', 'memory')
video.ReturnedColorSpace = 'rgb';
video.TriggerRepeat=inf; % disparos continuados
preview(video)
fpsMaximoWebCam = 30;
video.FrameGrabInterval=3;
fpsTrabajoWebCam = fpsMaximoWebCam/video.FrameGrabInterval;

resolucion = video.videoResolution;
numFilas = resolucion(2);
numColumnas = resolucion(1);

aviobj = VideoWriter('PracticaFinal_P1/Implementacion/01_GeneracionMaterial/Objeto.avi', 'Uncompressed AVI');
aviobj.FrameRate = fpsTrabajoWebCam;

duracionGrabacion = 15; % duracion en segundos
numFramesGrabacion = duracionGrabacion*aviobj.FrameRate;

open(aviobj) % objeto que guardará el video

start(video)

for i=1:numFramesGrabacion
    I=getdata(video,1); % captura un frame guardado en memoria.
    writeVideo(aviobj,I);
end

close all

stop(video)
close(aviobj);

