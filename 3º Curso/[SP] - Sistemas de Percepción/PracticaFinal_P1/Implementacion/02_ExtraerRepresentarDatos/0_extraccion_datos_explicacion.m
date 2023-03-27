%% 2.- GENERACIÓN DE CONJUNTO DE DATOS:

ruta = "";
nombreArchivo = "";

load([ruta nombreArchivo])

clear("ruta", "nombreArchivo")

%% VISUALIZACION DE LAS IMAGENES

[N, M,NumComp, NumImag] = size(imagenes);

% Vemos las imagenes
for i=1:NumImag
    imshow(imagenes(:,:,:,i)), title(num2str(i))
    pause
end


%% OUTLIERS

clear, close all

addpath("PracticaFinal_P1\Implementacion\02_ExtraerRepresentarDatos\VariablesGeneradas")

addpath("PracticaFinal_P1\Implementacion\02_ExtraerRepresentarDatos\Funciones\")

load("PracticaFinal_P1\Implementacion\02_ExtraerRepresentarDatos\VariablesGeneradas\Variables_02.mat")

red = 1;
green = 2;
blue = 3;

% Representacion de los datos

representa_datos_color_seguimiento_fondo(X_Color, Y_Color)

% ejemplo de valores anomalos en una componente
valoresY = unique(Y_Color);
posClaseInteres = green; % 2 porque green
filasClaseInteres = Y_Color == valoresY(posClaseInteres);

% Valores a analizar, todos y los de color de seguimiento
xCompleto = X_Color(:,green);
x = X_Color(filasClaseInteres, green); % x = conjunto de datos de color, soo la columna 2

% Valores estadisticos
media = mean(x);
valorMax = max(x);
valorMin = min(x);
dev = std(x);

figure, hist(x);
figure, boxplot(x);

xOrd = sort(x); numDatos = length(xOrd);
posQ1 = round(0.25*numDatos); % valor = 
Q1 = xOrd(posQ1);

posQ2 = round(0.5*numDatos);
Q2 = xOrd(posQ1);

% Criterio outliers
valorMinimoAceptado = Q1-1.5*RI
valorMaximoAceptado = Q3 + 1.5*RI

% Criterio outliers
valorMinimoAceptado2 = media-3*desv
valorMaximoAceptado2 = media+3*desv

[valorMinimoAceptado valorMaximoAceptado; valorMinimoAceptado2 valorMaximoAceptado2]

% detectar outliers
% esta linea no vale porque perdemos informacion del conjunto de datos
% completo
outliers = x<valorMinimoAceptado | x > valorMaximoAceptado

outliers = xCompleto < valorMinimoAceptado | xCompleto > valorMaximoAceptado

outliers = outliers & filasClaseInteres

filasOutliers = find(Outliers)

% Mostrar outliers rodeados
close all
representa_datos_color_seguimiento_fondo(X_Color,Y_Color)
hold on
plot3(X_Color(filasOutliers, 1), X_Color(filasOutliers, 2), X_Color(FilasOutliers,3),'ok')


%% Deteccion de outliers funcion

% criterio Q1-1.5*RI, Q3+1.5*RI
posClaseInteres = 2; % posicion del color de interes (posicion del vector)
pos_outliers = funcion_detecta_outliers_clase_interes(X, Y, posClaseInteres);


% representarlos



% Eliminar outliers -> elimar indices de X e Y

