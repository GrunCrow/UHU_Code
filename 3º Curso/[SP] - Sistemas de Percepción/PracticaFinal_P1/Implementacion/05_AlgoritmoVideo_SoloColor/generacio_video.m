% 
% 
% Carga la información de datosMultiplesEsferas_Clasificador y el numPíx.
% 
% 
% Requiere solo el vídeo y un script que lea el vídeo y le aplique el
% clasificador a cada frame del vídeo.
% 
% Por cada frame llama a calcula_deteccion_multiples_esferas_en_imagen y a
% la funcion_visualiza con la imagen binaria generada anteriormente.
% 
% Por cada frame llama a calcula_deteccion_multiples_esferas_en_imagen,
% eliminar las agrupaciones menores que numPix con vwareaopen.
% 
% Una vez tenemos la imagen binaria podemos aplicarle cualquier algoritmo
% como calcula_centroides o funcion_visualiza.
% 
% Ver todos los centroides, el de la agrupación mayor, color AND movimiento(Practica3.m)...
% 

%% Detección Objeto Por Color

pathsArchivos = "PracticaFinal_P1\Implementacion\05_AlgoritmoVideo_SoloColor\";

fichero = 'VariablesRequeridas\parametros_clasificador.mat';
load(pathsArchivos + fichero);

fichero = 'VideoSeguimiento.avi';
video = VideoReader(fichero);
get(video);

addpath(pathsArchivos + 'Funciones');

output = VideoWriter('Deteccion.mp4', 'MPEG-4');
output.FrameRate = video.FrameRate;
open(output);

video.CurrentTime = 0;
for i=1:video.NumFrames

    I = readFrame(video);
    Ib = bwareaopen(calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas(:,4),datosMultiplesEsferas(:,1:3)),numPix);
    Io = funcion_visualiza(I,Ib,[255 0 0], false);
    imshow(Io);
    writeVideo(output,Io);

end

close(output);

%% Detección de Objeto por Color y Centroide
fichero = 'VideoSeguimiento.avi';
video = VideoReader(fichero);
get(video);

output = VideoWriter('Deteccion_Centroide.avi', 'MPEG-4');
output.FrameRate = video.FrameRate;
open(output);

video.CurrentTime = 0;
for i=1:video.NumFrames

    I = readFrame(video);
    Ib = bwareaopen(calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas(:,4),datosMultiplesEsferas(:,1:3)),numPix);
    % [Ietiq,N] = bwlabel(Ib);
    stats = regionprops(Ib,'Area','Centroid'); 
        centroids = cat(1,stats.Centroid);
        areas = cat(1,stats.Area);

    %Io = funcion_visualiza(I,Ib,[255 0 0], false);
    if(~isempty(centroids))
            [~,pos] = max(areas);

            x = round(centroids(pos,2));
            y = round(centroids(pos,1));
        Ibcent = zeros(size(I,1),size(I,2));
        Ibcent(x-1:x+1,y-1:y+1) = 1;
        
        Io = funcion_visualiza(I,Ibcent & Ib,[255 0 0], false);
       
    else
        Ibcent = zeros(size(I,1),size(I,2));
        Ibcent(1:3,1:3) = 1;
        Io = funcion_visualiza(I,Ibcent & Ib,[255 0 0], false);
        
    end
    imshow(Io), hold on;
    writeVideo(output,Io);

end

close(output);

%% Detecta Color En Memoria - tiempo real
imaqmex('feature','-limitPhysicalMemoryUsage',false);
datos = imaqhwinfo('winvideo');
video = videoinput('winvideo',1,'MJPG_640x480');
video.TriggerRepeat = inf;
video.FramesPerTrigger = 3;
video.FrameGrabInterval = 3;

start(video);
while(video.FramesAcquired<150)
    I = getdata(video,1);  I = imresize(I,0.5);
    Ib = bwareaopen(calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas(:,4),datosMultiplesEsferas(:,1:3)),numPix);
    Io = funcion_visualiza(I,Ib,[255 0 0], false);
    imshow(Io);
end

stop(video);
flushdata(video);

rmpath(pathsArchivos + 'Funciones');