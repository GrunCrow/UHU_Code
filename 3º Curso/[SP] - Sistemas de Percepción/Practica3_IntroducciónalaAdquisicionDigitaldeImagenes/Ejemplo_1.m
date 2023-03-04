% 1.- Visualizar una secuencia de video que muestre el seguimiento de una 
% determinada zona de la escena. Esta zona será proporcionada al proceso 
% mediante una imagen almacenada en el ordenador. Utilizaremos la correlación
% normalizada para realizar el seguimiento.

clear all
clc

datos=imaqhwinfo('winvideo');
video=videoinput('winvideo',1,'YUY2_320x240'); %
video.ReturnedColorSpace='grayscale';c

% CAPTURAMOS UNA IMAGEN PARA EXTRAER LA PLANTILLA
preview(video) % se abra una pantalla gráfica que muestra lo que visualiza la cámara (1fps)
I = getsnapshot(video);

% De forma manual
imtool(I) % para mostrar la imagen por imtool y sacar las coordenadas de la plantilla
imtool close all

fila1=50; fila2=75; columna1=155; columna2=180;
Plantilla=I(fila1:fila2,columna1:columna2);
imshow(Plantilla)


% De forma automatizada
% Utilizamos la instrucción roipoly para seleccionar un área de interés
% Pinchamos cuatro veces crear el polígono de interés y doble click.
roi = roipoly(I); % Matriz lógica, donde a 1 se marcan
%los píxeles de interés

[filas columnas]=find(roi==1); % Coordenadas de los pixeles que integran
% la region de interés
fila1=min(filas); fila2=max(filas);
columna1=min(columnas); columna2=max(columnas);
Plantilla=I(fila1:fila2,columna1:columna2);
imshow(Plantilla)
[NT MT]=size(Plantilla);
% Para capturar una secuencia de frames:
video.TriggerRepeat=inf;
video.FrameGrabInterval=5; % de todos los frames que se capturan, sólo se van grabando de 5 en 5.
start(video) % el dispositivo de video empieza a funcionar con la configuración almacenada en el objeto.

while (video.FramesAcquired<150)
    I=getdata(video,1); % captura un frame guardado en memoria.
    ncc = normxcorr2(Plantilla,I);
    [Nncc Mncc]=size(ncc);
    ncc=ncc(1+floor(NT/2):Nncc-floor(NT/2),1+floor(MT/2):Mncc-floor(MT/2));
    [i j]=find(ncc==max(ncc(:)));
imshow(I),hold on, plot(j,i,'R*'),hold off
end

stop(video)

delete(video);

clear video;