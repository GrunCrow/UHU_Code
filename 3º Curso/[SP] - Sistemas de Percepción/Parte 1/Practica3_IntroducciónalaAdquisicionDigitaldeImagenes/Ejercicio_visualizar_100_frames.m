%% Ejercicio
% Visualiza 100 frames (en color o de intensidad) a una tasa de 10fps donde
% se visualice una marca roja (* o caja 5x5) moviendose de forma aleatoria
% por la imagen

% 100 frames a 10 fps = 10 segundos de video a 10 fps
%       - si max fps = 30 -> 10 segundos = 30 fps / 3 fps/s

stop(video)
close(aviobj)

clear all;
clc;

datos=imaqhwinfo('winvideo');
video=videoinput('winvideo',1,'MJPG_320x240');
video.ReturnedColorSpace = "rgb";

% video.TriggerRepeat=inf; % set(video,'TriggerRepeat',Inf); Con esta
% configuración, infinitos disparos

video.TriggerRepeat = inf; % disparos continuados

% Número de imágenes o frames que se capturan por disparo
video.FrameGrabInterval=2;

%  Tardará x en capturar x frames, porque ha hecho 1 disparos a 10 frames
%  por disparo

% CAPTURAMOS UNA IMAGEN PARA EXTRAER LA PLANTILLA
% preview(video) % se abra una pantalla gráfica que muestra lo que visualiza la cámara (1fps)


fpsMaximo = 30;
fpsTrabajo = fpsMaximo / video.FrameGrabInterval; % 30/3 = 10 fps * 10 segundos = 100 frames

% resolucion
Resolucion = video.videoResolution;
numFilas = Resolucion(2);
numColumnas = Resolucion(1);

% objeto avi, donde se guardará la secuencia de video
aviobj = VideoWriter("Ejemplo.avi", "Uncompressed AVI");
aviobj.FrameRate = fpsTrabajo; % establecer el framerate

% tiempo de duracion (10 segundos)
duracionGrabacion = 10;
numFramesGrabacion = duracionGrabacion * aviobj.FrameRate; % 10 * 10 fps = 100 frames en la grabacion

open(aviobj);

% creacion de valores aleatorios, crea numFramesGrabacion (100 valores
% aleatorios) en un vector y los guarda en 'X'
valores = rand(numFramesGrabacion,1);
ValoresX = round((numColumnas-1)*valores+1); % para asegurar que este entre las columnas que hay en el frame mult por el numcols y redondea asi seran valores entre 1 y 320
% y en 'y'
valores = rand(numFramesGrabacion,1);
ValoresY = round((numFilas-1)*valores)+1;

% COMENZAR VIDEO
start(video)

% bucle para crear el asterisco
for i = 1 : numFramesGrabacion
    % coger el valor i aleatorio en x e y
    x = ValoresX(i);
    y = ValoresY(i);
    
    % capturar un frame guardado en memoria
    I = getdata(video,1);

    % mostrarlo por pantalla
    imshow(I), hold on, plot(x,y,'*r');
    
    % en el video guardado no aparece el asterisco -> poner la zona roja (1
    % pixel)
%     if(y>0 && y<numFilas) && (x>0 && x<numColumnas)
%         I(y,x,1:3) = [255 0 0];
%     end
    
    % pixel 4x4 completamente rellenado
    if(y>2 && y<numFilas-1) && (x>2 && x<numColumnas-1)
        % guardar datos del interior
        interior = I(y-1:y+1,x-1:x+1,:);
        
%       PREGUNTAR A DIEGO COMO CAMBIARLO EN UNA LINEA SOLO EL ROJO, NO ME
%       DEJA HACERLO COMO EN EL BUCLE DE ARRIBA
        I(y-2:y+2,x-2:x+2,1) = 255;
        I(y-2:y+2,x-2:x+2,2) = 0;
        I(y-2:y+2,x-2:x+2,3) = 0;
        
        % devolver valores del interior
        I(y-1:y+1,x-1:x+1,:) = interior;
    end

    writeVideo(aviobj, I);

end

stop(video)
close(aviobj)