%% GENERACION Y LECTURA ARCHIVOS DE VIDEO CON MATLAB

%%--------------------------------------------------

%% DETERMINAR LA VELOCIDAD DE CAPTURA MÁXIMA DE LA WEBCAM

video=videoinput('winvideo',1,'MJPG_320x240'); %
% video=videoinput('winvideo',1,'YUY2_640x480'); % Si la camara no permite
% trabajar en resolución 320x240 elegir 640x240 y reescalar a la mitad
% una vez adquirido cada frame: I = imresize(I,0.5)

video.TriggerRepeat=inf; % disparos continuados
video.FrameGrabInterval=1;
start(video)
TIEMPO=[];

while (video.FramesAcquired<150)
    [I TIME METADATA]=getdata(video,1);
    % I = imresize(I,0.5); si se esta trabajando con 640x480
    TIEMPO=[TIEMPO ; TIME METADATA.AbsTime];
    % imshow(I)
end

stop(video)

video

fpsMaximoWebCam = 15; % Decidir los fps de trabajo de la WebCam

preview(video) % Para ver directamente los fps a los que trabaja la WebCam


%% EJEMPLO: ALMACENAR LA SECUENCIA DE VIDEO PROCESADA EN UN ARCHIVO AVI
clear

video=videoinput('winvideo',1,'MJPG_320x240'); %
video.ReturnedColorSpace = 'grayscale';
video.TriggerRepeat=inf; % disparos continuados -> cuando se encuentre un start no parara hasta que encuentre un stop

% Se debe trabajar entorno a 10 fps
fpsMaximoWebCam = 30; % Decidir los fps de trabajo de la WebCam
video.FrameGrabInterval=3; % para 10 frames por segundos = 30/x = 10; x = 3
fpsTrabajoWebCam = fpsMaximoWebCam/video.FrameGrabInterval;

set(video, 'LoggingMode', 'memory') 
% Crear objeto archivo avi
% aviobj = VideoWriter('Ejemplo.avi', 'Uncompressed AVI');
aviobj = VideoWriter('Ejemplo.avi'); % todo lo que entre en el objeto aviobj se guardará en el archivo Ejemplo.avi
aviobj.FrameRate = fpsTrabajoWebCam;
duracionGrabacion = 10; % duracion en segundos
numFramesGrabacion = duracionGrabacion*aviobj.FrameRate;

open(aviobj) % objeto que guardará el video

start(video)

for i=1:numFramesGrabacion
    I=getdata(video,1); % captura un frame guardado en memoria.
    % imshow(255-I)
    writeVideo(aviobj,255-I);
end

stop(video)
close(aviobj);


%% EJEMPLO: ALMACENAR LA SECUENCIA DE VIDEO GENERADA Y PROCESADA

clear
video=videoinput('winvideo',1,'MJPG_320x240'); %
video.ReturnedColorSpace = 'grayscale';
video.TriggerRepeat=inf; % disparos continuados
preview(video)
fpsMaximoWebCam = 30;
video.FrameGrabInterval=3; % trabajar entorno a 10 fps
fpsTrabajoWebCam = fpsMaximoWebCam/video.FrameGrabInterval;

aviobjI = VideoWriter('SecuenciaEntrada.avi', 'Uncompressed AVI');
aviobjI.FrameRate = fpsTrabajoWebCam;

duracionGrabacion = 10; % duracion en segundos
numFramesGrabacion = duracionGrabacion*aviobjI.FrameRate;

set(video, 'LoggingMode', 'disk&memory')
video.DiskLogger = aviobjI;

open(aviobjI)

aviobjO = VideoWriter('SecuenciaSalida.avi');
aviobjO.FrameRate = aviobjI.FrameRate;
open(aviobjO)

start(video)

while (video.FramesAcquired<numFramesGrabacion)
    I=getdata(video,1); % captura un frame guardado en memoria.
    % imshow((255-I))
    writeVideo(aviobjO,255-I);
end

stop(video)
close(aviobjO);
close(aviobjI);



%% EJEMPLO: MOSTRAR UNA MARCA DE FORMA ALEATORIA EN CADA FRAME. LA MARCA
% DEBE SER CUADRADA DE DIMENSIONES WXW - ASIGNAR UN VALOR A W DE 7

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

aviobj = VideoWriter('Ejemplo.avi', 'Uncompressed AVI');
aviobj.FrameRate = fpsTrabajoWebCam;

duracionGrabacion = 10; % duracion en segundos
numFramesGrabacion = duracionGrabacion*aviobj.FrameRate;

% Coordenadas aleatorias del punto central de la marca

W = 7; % ancho y alto de la marca de seguimiento
vMin = 1+floor(W/2);

vMax = numColumnas-floor(W/2);
valoresX = round(vMin+(vMax-vMin).*rand(numFramesGrabacion,1));

vMax = numFilas-floor(W/2);
valoresY = round(vMin+(vMax-vMin).*rand(numFramesGrabacion,1));

open(aviobj)
start(video)

for i=1:numFramesGrabacion
    x = valoresX(i); y = valoresY(i);
    I=getdata(video,1); % captura un frame guardado en memoria.
    imshow(I), hold on, plot(x,y,'*r');
    I(y-floor(W/2):y+floor(W/2), x-floor(W/2):x+floor(W/2),:) = 0;
    writeVideo(aviobj, I);
end

stop(video)
close(aviobj);



%% LECTURA DE ARCHIVOS DE VIDEO YA CREADOS

clear
aviobjI = VideoReader('Ejemplo.avi');
get(aviobjI)

NumeroFrames = aviobjI.Duration*aviobjI.FrameRate; % aviobjI.NumFrames
NumFilasFrame = aviobjI.Height;
NumeroColumnasFrame = aviobjI.Width;
FPS = aviobjI.FrameRate;

% LECTURA DE UN FRAMES ESPECÍFICO
I1 = readFrame(aviobjI);
aviobjI
I2 = readFrame(aviobjI);
aviobjI

% Situamos el objeto vídeo en el frame anterior y leemos el siguiente:
Numero_de_Frame = 10;
aviobjI.CurrentTime=(Numero_de_Frame-1)/aviobjI.FrameRate;
I10 = readFrame(aviobjI);

% LECTURA DEL VIDEO COMPLETO Y GENERACIÓN DE UNO PROCESADO A PARTIR DE EL

aviobjO = VideoWriter('EjemploProc.avi');
aviobjO.FrameRate = FPS; % El video tendra la misma tasa de frames
open(aviobjO)

aviobjI.CurrentTime=0; % Ponemos a 0
for i=1:NumeroFrames
    I = readFrame(aviobjI);
    writeVideo(aviobjO, 255-I);
end

close(aviobjO);