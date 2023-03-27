%%%% Datos RGB de píxeles de Interés

%% Datos RGB de pixeles de interes extraidos de una imagen

clear, close all, clc

I = imread("im1.jpg");

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

ROI = roipoly(I); % informacion del poligono seleccionado

datos = [R(ROI) G(ROI) B(ROI)];
axis([0 255 0 255 0 255])

%% DATOS RGB DE PIXELES DE INTERES EXTRAIDOS DE VAR

numRegiones = 3;
datos = [];

numImagenes = 3;

for n =numImagenes

    for j = numRegiones
        ROI = roipoly(I);
    
    end

end

datosRojo = datos;
datosOtrosColores = datos;

%% REPRESENTAR LA INFORMACION
figure
% 2,3, 4 porq el R empieza en la 2 columna
plot3(datosRojo(:,2),datosRojo(:,3),datosRojo(:,4))
hold on
plot3(datosOtrosColores(:,2),datosOtrosColores(:,3),datosOtrosColores(:,4))
hold off

axis([0 255 0 255 0 255])

legend("Datos Rojo", "Datos Otros Colores")
xlabel("Componente R"), ylabel("Componente G"), zlabel("Z label")

% almacenar informacion e interes
save("./VariablesGeneradas/conjunto_de_datos_original.mat")

clear
load("./VariablesGeneradas/conjunto_de_datos_original.mat")
funcion_representa_datos(X, Y)

%% GENERAR CONJUNTO DE DATOS X-Y
X = [datosRojo(:,2:4); datosOtrosColores(:,2:4)];
Y = [ones(size(datosRojo,1),1); zeros(size(datosOtrosColores,1),1)];




...




legend(leyenda)
axis([0 255 0 255 0 255])
