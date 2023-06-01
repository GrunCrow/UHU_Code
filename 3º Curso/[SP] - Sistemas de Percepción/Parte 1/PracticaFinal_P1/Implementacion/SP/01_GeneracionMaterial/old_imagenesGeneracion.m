% imagenes con el objeto en diferentes posiciones representativas

basePath = "PracticaFinal_P1/Implementacion/01_GeneracionMaterial/";

baseName_Objeto = 'img_Objeto';

video=videoinput('winvideo',1,'MJPG_320x240'); %
set(video, 'LoggingMode', 'memory')
video.ReturnedColorSpace = 'rgb';
video.TriggerRepeat=inf; % disparos continuados

num_Repeticiones = 10;

Imagenes_Calibracion_sinObjeto = uint8(zeros(240,320,3,num_Repeticiones));
Imagenes_Calibracion_conObjeto = uint8(zeros(240,320,3,num_Repeticiones));

preview(video, "Video con Objeto")
start(video)
for counter=1:num_Repeticiones
    pause;
    I = getsnapshot(video);
    imwrite(I, basePath + baseName + num2str(counter))
    Imagenes_Calibracion_conObjeto(:,:,:,counter) = I;
end
stop(video)

% preview(video)
% start(video)
% for i=1:num_Repeticiones
%     pause;
%     I = getsnapshot(video);
%     Imagenes_Calibracion_sinObjeto(:,:,:,i) = I;
% end
% stop(video)

save('./VariablesGeneradas/ImagenesCalibracion_conObjeto.mat', ...
    "Imagenes_Calibracion_conObjeto");
