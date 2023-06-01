%% EJERCICIO 2

% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

%% Apartado 2.1.

% Recuperar path de las imágenes de calibración y el nombre del archivo
pathArchivos = "PruebaFinal_1/02_Ejercicio2_Datos/";
nombreObjeto = "ImagenesEntrenamiento_Calibracion.mat";

% Cargamos las imágenes de calibración
load(pathArchivos + nombreObjeto)

% Creamos las matrices de ROI Color que serán binarias
ROI_Color = zeros(size(imagenes(:,:,1,2:4)));
ROI_Color_Fondo = zeros(size(imagenes(:,:,1,1)));

% Seleccionamos los píxeles que nos interesan - CON OBJETO
for i=2:4
    ROI_Color(:,:,:,i-1) = roipoly(imagenes(:,:,:,i));
end

% Visualizamos las regiones de interés
for i=1:size(ROI_Color,4)
    imshow(ROI_Color(:,:,i));
    pause;
end

% Seleccionamos los píxeles que nos interesan - SIN OBJETO
for i=1:1
    ROI_Color_Fondo(:,:,:,i) = roipoly(imagenes(:,:,:,i));
end

% Visualizamos las regiones de interés
for i=1:size(ROI_Color_Fondo,4)
    imshow(ROI_Color_Fondo(:,:,:,i));
    pause;
end

% Guardamos las matrices de ROI Color y ROI Color Fondo en un archivo .mat
% save(pathsArchivos + '/VariablesGeneradas/ROIs.mat', 'ROI_Color', 'ROI_Color_Fondo');

% Creamos la matriz vacía para guardar los valores de color
DatosColor = [];

% Definimos los índices para acceder a los colores R, G y B
red = 1;
green = 2;
blue = 3;

% Para todas las imágenes de calibración CON OBJETO
for counter=2:4 % Imagenes Calibracion, de dimensión 4 -> id, R, G, B
    
    i = counter - 1;

    % Extraemos las matrices de intensidad de los colores RGB
    R = imagenes(:,:,red,counter);
    G = imagenes(:,:,green,counter);
    B = imagenes(:,:,blue,counter);

    % Selecciono los píxeles que interesan y guardo sus valores RGB
    % id_imagen - R - G - B
    DatosColor = [DatosColor;i*ones(size(R(ROI_Color(:,:,:,i)==1),1),1) double(R(ROI_Color(:,:,:,i)==1)), double(G(ROI_Color(:,:,:,i)==1)), double(B(ROI_Color(:,:,:,i)==1))]; % id_imagen - R - G - B
    % no interesan y guardo sus valores RGB
end


% Fondo
DatosFondo = [];

for counter=1:1
     DatosFondo = [DatosFondo; counter*ones(size(R(ROI_Color_Fondo(:,:,:,counter)==1),1),1) double(R(ROI_Color_Fondo(:,:,:,counter)==1)), double(G(ROI_Color_Fondo(:,:,:,counter)==1)), double(B(ROI_Color_Fondo(:,:,:,counter)==1))]; % id_imagen - R - G - B
end

% Guardo los valores RGB de todos los píxeles
X_Color = [DatosColor(:,:);DatosFondo(:,:)]; % Selecciono R - G - B
% Los píxeles que componen el área de interés se representan con 1 y los que no con un 0.
Y_Color = [ones(size(DatosColor,1),1);zeros(size(DatosFondo,1),1)]; 
% Concateno un vector columna de 1's del tamaño de DatosColor con otro de ceros del tamaño de DatosFondo


% X son valores RGB, Y dice si es o no es del color que estamos analizando
% (1 ó 0)
save(pathArchivos + 'conjunto_de_datos_original.mat', 'X_Color', 'Y_Color');



%% 2.2.- REPRESENTACIÓN DE LOS DATOS DEL COLOR OBJETO DE SEGUIMIENTO Y OTROS COLORES DEL FONDO DE LA ESCENA

% Representación de los datos.
datosRGBColor = X_Color(Y_Color==1,:);
datosRGBFondo = X_Color(Y_Color==0,:);

% representan los datos RGB de color y fondo en un gráfico 3D ('.r' para los datos de color y '.b' para los datos de fondo)
plot3(datosRGBColor(:,1),datosRGBColor(:,2),datosRGBColor(:,3),'.r'), hold on;
plot3(datosRGBFondo(:,1),datosRGBFondo(:,2),datosRGBFondo(:,3),'.b'), grid on;
xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b');