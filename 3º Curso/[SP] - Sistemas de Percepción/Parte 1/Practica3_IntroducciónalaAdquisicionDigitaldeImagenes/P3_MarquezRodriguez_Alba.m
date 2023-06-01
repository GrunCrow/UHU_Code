stop(video)
% close(aviobj)

clear all;
clc;

addpath("Practica3_IntroducciónalaAdquisicionDigitaldeImagenes");

imaqmex('feature','-limitPhysicalMemoryUsage',false);


% codigo comun para todos los ejs:
datos=imaqhwinfo('winvideo');

% trabajar con resolucion minima: 320x240, en el caso de que la minima no
% pueda ser esa, hacer más adelante:
% Ic = getsnapshot(video); Ic = resize(Ic,0.5) -> reescalar a la mitad
video=videoinput('winvideo',1,'MJPG_320x240');

video.TriggerRepeat = inf;
video.FramesPerTrigger = 3;
video.FrameGrabInterval = 3;

video.ReturnedColorSpace = "rgb";

preview(video);

% hacer ejercicios con las funciones de matlab y sin ellas (con funciones
% programadas)

%% Ejercicio 1
% 1.- Utilizando la función de Matlab subplot, muestre en una misma ventana tipo figure 
% la imagen capturada y 3 imágenes que resalten, sobre la imagen original, 
% aquellos píxeles cuya intensidad sea mayor que un determinado umbral 

% (asigne para esas 3 imágenes, valores de umbral: 70, 140 y 210, respectivamente). 
% La intensidad de un píxel se calculará como la media de los niveles de gris de las 
% componentes roja, verde y azul.

Ic = getsnapshot(video);

umbrales = [70 140 210];

imshow(Ic);

% calcular la media de los canales de intensidad, sino en bwlabel -> Ib_70(:,:,1)
I_intensidad = uint8(mean(Ic,3));

imshow(I_intensidad);

Ib_70 = I_intensidad > 70;
Ib_140 = I_intensidad > 140;
Ib_210 = I_intensidad > 210;

Ic_70 = funcion_visualiza(I_intensidad,Ib_70,[0,255,0],false);
Ic_140 = funcion_visualiza(I_intensidad,Ib_140,[0,255,0],false);
Ic_210 = funcion_visualiza(I_intensidad,Ib_210,[0,255,0],false);

subplot(2,2,1), imshow(Ic);
title('Original')
subplot(2,2,2), imshow(Ic_70);
title('Umbral 70')
subplot(2,2,3), imshow(Ic_140);
title('Umbral 140')
subplot(2,2,4), imshow(Ic_210);
title('Umbral 210')




%% Ejercicio 2 -> este ejercicio tiene todo lo que nos podría preguntar en la modif
% 2.- Para cada una de las imágenes generadas en el apartado anterior:
% - Visualice sobre la imagen original las 5 agrupaciones mayores de píxeles conectados.
% - Localice a través de su centroide las agrupaciones anteriores y, en otro color, 
%   el centroide de la mayor agrupación para distinguirla.


% Funcion etiquetar: Ietiq N
[Ietiq_70, N_70]   = bwlabel(Ib_70); % funcion etiquetar de matlab, vecindad por defecto?, para cambiar añadir param [Ietiq, N] = bwlabel(Ib, '4')
[Ietiq_140, N_140] = bwlabel(Ib_140);
[Ietiq_210, N_210] = bwlabel(Ib_210);

% estos son los centroides a mostrar de las posiciones de las 5 primeras de
% esos indices ordenados de mayor a menor
% Funcion calcula areas areas
% = calcula area, calcula centroide, hay q especificar porq sino da muchos
% descriptores
stats_70 = regionprops(Ietiq_70,'Area','Centroid');
stats_140 = regionprops(Ietiq_140,'Area','Centroid');
stats_210 = regionprops(Ietiq_210,'Area','Centroid');

%calcula areas y centroides de diferentes agrupaciones q se le pasa como parametro de la funcion, la funcion calcula_centroide trabaja sobre sobre la Imagen con la matrz etiquetada, hace lo mismo
areas_70 = cat(1, stats_70.Area); 
areas_140 = cat(1, stats_140.Area);
areas_210 = cat(1, stats_210.Area);

% centroides
centroides_70 = cat(1, stats_70.Centroid);
centroides_140 = cat(1, stats_140.Centroid);
centroides_210 = cat(1, stats_210.Centroid);

% la clave es q cuando ordenemos nos quedemos con los indices
% Ordenar de mayor a menor las areas quedandote/generando con los indices
[~,pos_70] = max(cat(1,areas_70));
[~,pos_140] = max(cat(1,areas_140));
[~,pos_210] = max(cat(1,areas_210));

[~,sortedPosArea_70] = sort(cat(1,areas_70),'descend');
[~,sortedPosArea_140] = sort(cat(1,areas_140),'descend');
[~,sortedPosArea_210] = sort(cat(1,areas_210),'descend');

sortedPosArea_70 = sortedPosArea_70(1:5);
sortedPosArea_140 = sortedPosArea_140(1:5);
sortedPosArea_210 = sortedPosArea_210(1:5);

IetiqAux_70 = zeros(size(Ietiq_70));
IetiqAux_140 = zeros(size(Ietiq_140));
IetiqAux_210 = zeros(size(Ietiq_210));

% if N>5     
% seleccionar el numPix = areas(5)
% para coger cada una de las 5 areas cogidas
for i=1:5
%     sumar valores
    IetiqAux_70 = IetiqAux_70 + (Ietiq_70 == sortedPosArea_70(i));
    IetiqAux_140 = IetiqAux_140 + (Ietiq_140 == sortedPosArea_140(i));
    IetiqAux_210 = IetiqAux_210 + (Ietiq_210 == sortedPosArea_210(i));
end

% Funcion filtra objetos
    % Calcular el centroide 
x_70 = centroides_70(sortedPosArea_70(1:5),1);
y_70 = centroides_70(sortedPosArea_70(1:5),2);
x_140 = centroides_140(sortedPosArea_140(1:5),1);
y_140 = centroides_140(sortedPosArea_140(1:5),2);
x_210 = centroides_210(sortedPosArea_210(1:5),1);
y_210 = centroides_210(sortedPosArea_210(1:5),2);
% else

Iaux_70 = funcion_visualiza(I_intensidad,IetiqAux_70,[0,255,0],false);
Iaux_140 = funcion_visualiza(I_intensidad,IetiqAux_140,[0,255,0],false);
Iaux_210 = funcion_visualiza(I_intensidad,IetiqAux_210,[0,255,0],false);

subplot(2,2,2), imshow(Ic_70);
title('Umbral 70')
subplot(2,2,3), imshow(Ic_140);
title('Umbral 140')
subplot(2,2,4), imshow(Ic_210);
title('Umbral 210')
subplot(2,2,1), imshow(Ic), hold on;
title('Imagen Original')
plot(x_70(2:5),y_70(2:5),'*r');
plot(x_70(1),y_70(1),'*b');





% Funcion etiquetar: Ietiq N
[Ietiq_70, N_70]   = bwlabel(Ib_70); % funcion etiquetar de matlab, vecindad por defecto?, para cambiar añadir param [Ietiq, N] = bwlabel(Ib, '4')
[Ietiq_140, N_140] = bwlabel(Ib_140);
[Ietiq_210, N_210] = bwlabel(Ib_210);

% matriz de salida inicializada a 0
Io_70 = uint8(zeros(size(Ietiq_70)));
Io_140 = uint8(zeros(size(Ietiq_140)));
Io_210 = uint8(zeros(size(Ietiq_210)));

% visualiza desde la etiqueta 1 a la N
for i=1:5
    % genera 3 valores enteros aleatorios que será el color de la X a
    % etiquetar
    color = [255*rand(),255*rand(),255*rand()];
    Io_70 = Io_70 + uint8(funcion_visualiza(Ib_70,Ietiq_70 == i, color, false)); 
    Io_140 = Io_140 + uint8(funcion_visualiza(Ib_140,Ietiq_140 == i, color, false));
    Io_210 = Io_210 + uint8(funcion_visualiza(Ib_210,Ietiq_210 == i, color, false));
end

subplot(2,2,2), imshow(Io_70);
title('Umbral 70')
subplot(2,2,3), imshow(Io_140);
title('Umbral 140')
subplot(2,2,4), imshow(Io_210);
title('Umbral 210')
subplot(2,2,1), imshow(Ic), hold on;
title('Imagen Original')
plot(x_70(2:5),y_70(2:5),'*r');
plot(x_70(1),y_70(1),'*b');



%% Ejercicio 3
% 3.- La escena inicialmente oscurecida y aclarándose progresivamente 
% (utilizar la instrucción imadjust y valores de gamma entre 0 y 4 con pasos de 0.05).

% imadjust(I, gamma) si gamma < 1 aclara, si > oscurece, asi q primer gamma
% = 4 y ultimo gamma = 0

start(video);

% de 4 a 0 con pasos de 0.05, asi q decrementamos
for gamma=4:-0.05:0
    Img = getdata(video,1);
%     cambia gamma del frame actual
    Img_b = imadjust(Img,[],[],gamma);
%     muestra imagen original y la imagen con gamma cambiado al lado
    imshow([Img Img_b]);
    titulo = "Cambio de valor gamma: " + num2str(gamma);
    title(titulo);
end

stop(video);

flushdata(video);

%% Ejercicio 4
% 4.- Todos los píxeles que tengan una intensidad mayor que un determinado umbral. 
% Asignar inicialmente el valor 0 a este umbral e ir aumentándolo progresivamente 
% con pasos de unidad hasta el 255.


start(video);
% como queremos que medir la intensidad lo ponemos directamente a grayscale
% y asi no tenemos que hacer media de pixeles (?)
video.ReturnedColorSpace = 'grayscale';

% umbral de 0 a 255 con paso de unidad
for umbral=0:255
%     tomar frame actual
    Img = getdata(video,1);
% imagen binaria en la que el umbral sea superior
    Img_b = funcion_visualiza(Img,Img>umbral,[255,0,0],false);
    imshow([Img Img_b(:,:,1)])
    titulo = "Intensidad mayor a umbral: " + num2str(umbral);
    title(titulo);
end

stop(video);

flushdata(video);

% 5.1.- Las diferencias que se producen entre los distintos frames de intensidad 
% que captura la webcam (utilizar la instrucción imabsdiff para hacer la diferencia 
% entre el frame actual y el adquirido previamente).

% el video esta de antes en byn -> intensidad

start(video);

anterior = getdata(video,1);

while(true) %(video.FramesAcquired<100) % le ponemos limite de frames 100 = 10 segundos a 30 fps max, 3 disparos por frame
    actual = getdata(video,1); 

    img_diferencia = imabsdiff(actual,anterior);
    
    imshow([anterior img_diferencia actual])

    % actualizar frame anterior al actual
    anterior = actual;

    titulo = "Diferencia entre frames de intensidad";
    title(titulo);
end

stop(video);

flushdata(video);

% 5.2.- Los píxeles cuyas diferencias de intensidad son significativas 
% (considerar un umbral de 100 para establecer de diferencias de intensidad 
% significativas).

start(video);

umbral = 25;
anterior = getdata(video,1);

while(true)
    actual = getdata(video,1); 

%     img_diferencia = imabsdiff(actual,anterior);
% 
%     img_diferencia_significativa = img_diferencia > umbral;
    
%     img_diferencia_significativa = funcion_visualiza(actual,img_diferencia_significativa,[0,255,0],false);
    
    img_diferencia_significativa = funcion_visualiza(actual,imabsdiff(actual,anterior)>25,[0,255,0],false);
    
    imshow([img_diferencia_significativa])
    titulo = "Diferencia entre frames de intensidad con umbral: " + num2str(umbral);
    title(titulo);
    
    % actualizar frame anterior al actual
    anterior = actual;
end

stop(video);

flushdata(video);

% 5.3.- El seguimiento de la agrupación mayor de píxeles que presenta una diferencia 
% de intensidad significativa. El seguimiento debe visualizarse a través de un punto 
% rojo situado en el centroide de la agrupación.

start(video);

umbral = 25;
anterior = getdata(video,1);

while(true)
    actual = getdata(video,1); 
    
    img_diferencia = imabsdiff(actual,anterior);

    img_diferencia_significativa = img_diferencia > umbral;

    [Ietiq,N] = bwlabel(img_diferencia_significativa);
    stats = regionprops(Ietiq,'Area','Centroid');

    areas = cat(1,stats.Area); centroids = cat(1,stats.Centroid);
    [~,sortedAreaPos] = sort(areas,'descend');
        
    imshow([Ietiq actual]), hold on;
    titulo = "Seguimiento de mayor agrupación con umbral: " + num2str(umbral);
    title(titulo);
        if(size(areas) > 0)
            plot(centroids(sortedAreaPos(1),1),centroids(sortedAreaPos(1),2),'*r');
        end

    % actualizar frame anterior al actual
    anterior = actual;

    
end

stop(video);

flushdata(video);












%     %% Ejercicio 5.1. 
%     % Diferencias entre los distintos frames de intensidad que captura 
%     % la webcam.
%     clc
%     clear all
% 
%     imaqmex('feature','-limitPhysicalMemoryUsage',false);
%     datos = imaqhwinfo('winvideo');
%     video = videoinput('winvideo',1,'MJPG_640x480');
%     video.TriggerRepeat = inf;
%     video.FramesPerTrigger = 3;
%     video.FrameGrabInterval = 3;
%     video.ReturnedColorSpace = 'grayscale';
% 
%     start(video);
%     anterior = getdata(video,1);anterior = imresize(anterior,0.5);
%     while(video.FramesAcquired<100)
%         actual = getdata(video,1); actual = imresize(actual,0.5);
%         Ib = imabsdiff(actual,anterior);
%         anterior = actual;
%         imshow([Ib])
%     end
% 
%     stop(video);
%     flushdata(video);
% 
%     %% 5.2
%     % Píxeles cuya diferencia de intensidad sea mayor de 100.
%     clc
%     clear all
% 
%     imaqmex('feature','-limitPhysicalMemoryUsage',false);
%     datos = imaqhwinfo('winvideo');
%     video = videoinput('winvideo',1,'MJPG_640x480');
%     video.TriggerRepeat = inf;
%     video.FramesPerTrigger = 3;
%     video.FrameGrabInterval = 3;
%     video.ReturnedColorSpace = 'grayscale';
% 
%     start(video);
%     anterior = getdata(video,1);anterior = imresize(anterior,0.5);
%     while(true)
%         actual = getdata(video,1); actual = imresize(actual,0.5);
%         Ib = funcion_visualiza(actual,imabsdiff(actual,anterior)>25,[0,255,0],false);
%         anterior = actual;
%         imshow([Ib])
%     end
% 
%     stop(video);
%     flushdata(video);
% 
%     %% Detectar centroide de la mayor agrupación de píxeles
%     clc
%     clear all
% 
%     imaqmex('feature','-limitPhysicalMemoryUsage',false);
%     datos = imaqhwinfo('winvideo');
%     video = videoinput('winvideo',1,'MJPG_640x480');
%     video.TriggerRepeat = inf;
%     video.FramesPerTrigger = 3;
%     video.FrameGrabInterval = 3;
%     video.ReturnedColorSpace = 'grayscale';
% 
%     start(video);
%     anterior = getdata(video,1);anterior = imresize(anterior,0.5);
%     while(video.FramesAcquired<150)
%         actual = getdata(video,1); actual = imresize(actual,0.5);
%         %Ib = funcion_visualiza(actual,imabsdiff(actual,anterior)>25,[0,255,0],false);
%         [Ietiq,N] = bwlabel(imabsdiff(actual,anterior)>75);
%         stats = regionprops(Ietiq,'Area','Centroid');
%         anterior = actual;
%         areas = cat(1,stats.Area); centroids = cat(1,stats.Centroid);
% 
%         [~,sortedAreaPos] = sort(areas,'descend');
%         
%         imshow([Ietiq actual]), hold on;
%         if(size(areas) > 0)
%             plot(centroids(sortedAreaPos(1),1),centroids(sortedAreaPos(1),2),'+r');
%         end
%     end
% 
%     stop(video);
%     flushdata(video);
