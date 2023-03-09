%% EJERCICIOS PROPUESTOS

% 1.- Grabar un video a 10fps de 15 segundos

clear
video=videoinput('winvideo',1,'MJPG_320x240'); %
video.ReturnedColorSpace = 'rgb';
video.TriggerRepeat=inf; % disparos continuados

preview(video)

fpsMaximoWebCam = 30;
video.FrameGrabInterval=3; % trabajar entorno a 10 fps
fpsTrabajoWebCam = fpsMaximoWebCam/video.FrameGrabInterval;

aviobjI = VideoWriter('SecuenciaEntrada.avi');
aviobjI.FrameRate = fpsTrabajoWebCam;

duracionGrabacion = 15; % duracion en segundos
numFramesGrabacion = duracionGrabacion*aviobjI.FrameRate;

set(video, 'LoggingMode', 'disk&memory')
video.DiskLogger = aviobjI;

open(aviobjI)

start(video)

stop(video)
close(aviobjI);


% 2.- Procesar el vídeo y generar uno nuevo que muestre sobre las imágenes
% capturadas una marca roja que se mueva de forma aleatoria. La marca debe ser
% una cruz + de WxW (alto y ancho), siendo W un valor impar. Asignar W = 15.

clear;

addpath("GeneracionArchivosDeVideo");

aviobjI = VideoReader('GeneracionArchivosDeVideo/SecuenciaEntrada.avi');
get(aviobjI)

NumFrames = aviobjI.Duration*aviobjI.FrameRate; % aviobjI.NumFrames
NumFilasFrame = aviobjI.Height;
NumColumnasFrame = aviobjI.Width;
FPS = aviobjI.FrameRate;

% LECTURA DEL VIDEO COMPLETO Y GENERACIÓN DE UNO PROCESADO A PARTIR DE EL
aviobjO = VideoWriter('GeneracionArchivosDeVideo/Ejercicio2_v2.avi');
aviobjO.FrameRate = FPS; % El video tendra la misma tasa de frames
open(aviobjO)



% Coordenadas aleatorias del punto central de la marca

W = 15; % ancho y alto de la marca de seguimiento
sub_W = W/3;

vMin = 1+floor(W/2);

vMax = NumColumnasFrame-floor(W/2);
valoresX = round(vMin+(vMax-vMin).*rand(NumFrames,1));

vMax = NumFilasFrame-floor(W/2);
valoresY = round(vMin+(vMax-vMin).*rand(NumFrames,1));

aviobjI.CurrentTime=0; % Ponemos a 0
for i=1:NumFrames
    x = valoresX(i); y = valoresY(i);
    I=readFrame(aviobjI); % captura un frame guardado en memoria.
    imshow(I), hold on, plot(x,y,'*r');
    corner_top_left = I(y-floor(W/2):y-3, x-floor(W/2):x-3,:); % x-floor(W/2):x-3 -> left
    corner_bottom_left = I(y+3:y+floor(W/2), x-floor(W/2):x-3,:);
    
    corner_top_right = I(y-floor(W/2):y-3, x+3:x+floor(W/2),:);
    corner_bottom_right = I(y+3:y+floor(W/2), x+3:x+floor(W/2),:);
%     corner_4 = I(y-floor(W/3):y+floor(W/3), x-floor(W/3):x+floor(W/3),:);

    I(y-floor(W/2):y+floor(W/2), x-floor(W/2):x+floor(W/2),:) = 0;

    I(y-floor(W/2):y-3, x-floor(W/2):x-3,:) = corner_top_left;
    I(y+3:y+floor(W/2), x-floor(W/2):x-3,:) = corner_bottom_left;
    I(y-floor(W/2):y-3, x+3:x+floor(W/2),:) = corner_top_right;
    I(y+3:y+floor(W/2), x+3:x+floor(W/2),:) = corner_bottom_right;

    writeVideo(aviobjO, I);
end

close(aviobjO);

% 3.- Sobre la secuencia de video de entrada grabada inicialmente, realizar
% los ejercicios de la práctica 3, 4 y 5.2, grabando las secuencias de video
% de salida.