%% 2.1.- EXTRACCIÓN DE DATOS DEL COLOR OBJETO DE SEGUIMIENTO Y OTROS COLORES DEL FONDO DE LA ESCENA

% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

% Recuperar path de las imágenes de calibración y el nombre del archivo
pathsArchivos = "PracticaFinal_P1/Implementacion/02_ExtraerRepresentarDatos/";
nombreObjeto = "VariablesRequeridas/ImagenesCalibracion.mat";

% Cargamos las imágenes de calibración
load([pathsArchivos + nombreObjeto])

% Creamos las matrices de ROI Color que serán binarias
ROI_Color = zeros(size(Imagenes_Calibracion_ConObjeto(:,:,1,:)));
ROI_Color_Fondo = zeros(size(Imagenes_Calibracion_SinObjeto(:,:,1,1)));

% Seleccionamos los píxeles que nos interesan - CON OBJETO
for i=1:size(Imagenes_Calibracion_ConObjeto,4)
    ROI_Color(:,:,:,i) = roipoly(Imagenes_Calibracion_ConObjeto(:,:,:,i));
end

% Visualizamos las regiones de interés
for i=1:size(Imagenes_Calibracion_ConObjeto,4)
    imshow(ROI_Color(:,:,i));
    pause;
end

% Seleccionamos los píxeles que nos interesan - SIN OBJETO
for i=1:size(Imagenes_Calibracion_SinObjeto,4)
    ROI_Color_Fondo(:,:,:,i) = roipoly(Imagenes_Calibracion_SinObjeto(:,:,:,i));
end

% Visualizamos las regiones de interés
for i=1:size(Imagenes_Calibracion_SinObjeto,4)
    imshow(ROI_Color_Fondo(:,:,:,i));
    pause;
end

% Guardamos las matrices de ROI Color y ROI Color Fondo en un archivo .mat
save(pathsArchivos + '/VariablesGeneradas/ROIs.mat', 'ROI_Color', 'ROI_Color_Fondo');







%% Ejercicio 2.1.1.

% 2.1.1.- Para cada imagen de calibración que contiene el objeto,
% seleccionar una región de píxeles con el color de seguimiento. 
% Almacenar los valores R, G y B de todos los píxeles seleccionados. 
% Para ello, utilizar una matriz Matlab DatosColor, con 4 campos:
% identificador de la imagen, valores R, G y B.

% Creamos la matriz vacía para guardar los valores de color
DatosColor = [];

% Definimos los índices para acceder a los colores R, G y B
red = 1;
green = 2;
blue = 3;

% Para todas las imágenes de calibración
for counter=1:size(Imagenes_Calibracion_ConObjeto,4) % Imagenes Calibracion, de dimensión 4 -> id, R, G, B
    
    % Extraemos las matrices de intensidad de los colores RGB
    R = Imagenes_Calibracion_ConObjeto(:,:,red,counter);
    G = Imagenes_Calibracion_ConObjeto(:,:,green,counter);
    B = Imagenes_Calibracion_ConObjeto(:,:,blue,counter);

    % Selecciono los píxeles que interesan y guardo sus valores RGB
    % id_imagen - R - G - B
    DatosColor = [DatosColor;i*ones(size(R(ROI_Color(:,:,:,counter)==1),1),1) double(R(ROI_Color(:,:,:,counter)==1)), double(G(ROI_Color(:,:,:,counter)==1)), double(B(ROI_Color(:,:,:,counter)==1))]; % id_imagen - R - G - B
    % no interesan y guardo sus valores RGB
end


% Fondo
DatosFondo = []

for counter=1:size(ROI_Color_Fondo,4)
     DatosFondo = [DatosFondo; counter*ones(size(R(ROI_Color_Fondo(:,:,:,counter)==1),1),1) double(R(ROI_Color_Fondo(:,:,:,counter)==1)), double(G(ROI_Color_Fondo(:,:,:,counter)==1)), double(B(ROI_Color_Fondo(:,:,:,counter)==1))]; % id_imagen - R - G - B
end

%% Ejercicio 2.1.3. 
% 2.1.3.- Generación de un primer conjunto de datos X e Y:

% X: matriz de tantas filas como muestras de píxeles haya en DatosColor y DatosFondo y 
% tres columnas (valores de R, G y B). Es decir, se genera concatenando verticalmente 
% la información RGB de DatosColor y DatosFondo.

% Y: vector columna con dos posibles valores: 0 y 1. El valor 0 se asignará a 
% aquellas filas de X que se correspondan con muestras del fondo; el 1 es el valor 
% de codificación que se utilizará para indicar que la fila de datos de X pertenece 
% a la clase de píxeles del color de seguimiento.

% Guardo los valores RGB de todos los píxeles
X_Color = [DatosColor(:,2:4);DatosFondo(:,2:4)]; % Selecciono R - G - B
% Los píxeles que componen el área de interés se representan con 1 y los que no con un 0.
Y_Color = [ones(size(DatosColor,1),1);zeros(size(DatosFondo,1),1)]; 
% Concateno un vector columna de 1's del tamaño de DatosColor con otro de ceros del tamaño de DatosFondo



%% 2.2.- REPRESENTACIÓN DE LOS DATOS DEL COLOR OBJETO DE SEGUIMIENTO Y OTROS COLORES DEL FONDO DE LA ESCENA

%% Ejercicio 2.2.1.
% 2.2.1.- Representar en el espacio RGB, con un rango de variación 0-255 en 
% los tres ejes, todos los valores RGB de los píxeles del color de seguimiento 
% y del fondo de la escena. En la representación, utilizar distintos colores para 
% distinguir las dos clases consideradas: color de seguimiento, color/es de fondo

% Representación de los datos.
datosRGBColor = X_Color(Y_Color==1,:);
datosRGBFondo = X_Color(Y_Color==0,:);

% representan los datos RGB de color y fondo en un gráfico 3D ('.r' para los datos de color y '.b' para los datos de fondo)
plot3(datosRGBColor(:,1),datosRGBColor(:,2),datosRGBColor(:,3),'.r'), hold on;
plot3(datosRGBFondo(:,1),datosRGBFondo(:,2),datosRGBFondo(:,3),'.b'), grid on;
xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b');

% X son valores RGB, Y dice si es o no es del color que estamos analizando
% (1 ó 0)
save(pathsArchivos + '/VariablesGeneradas/XY_Color.mat', 'X_Color', 'Y_Color');



addpath(pathsArchivos + "Funciones")

representa_datos_color_seguimiento(X_Color,Y_Color);

xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b'); 
axis([0 255 0 255 0 255]);   
