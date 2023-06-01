clear, close all


pathArchivos = "Parte 2/Practica4_TecnicasBasicasProcesamiento/";

% fichero = "A1.jpg";
% load(pathArchivos + fichero)

addpath(pathArchivos + "Imagenes")

I = imread("A1.jpg");
figure, imshow(I), figure, imhist(I);

h = imhist(I);


%% Coger los diferentes picos de máximos
% Primer Máximo
[numPixMax, g1] = max(h);
% Este es un maximo absoluto pero tiene maximos locales, para conseguir el
% otro grupo de maximos -> evaluar una expresión que penalice los valores
% máximos cercanos al máximo global

%% TO-DO APRENDERSE ESTA EXPRESION: 

% esto podria ser una funcion: min, g1, g2 = funcion_Min_Entre_Max()

% Segundo Máximo
metrica = zeros(size(h));
for g = 1:256
    metrica(g) = (g-g1)^2*h(g);
end

[temp, g2] = max(metrica);

% h(1:77) = numPixMax;
% h(184:256) = numPixMax;
% [valor, valorMinimo] = min(h);

% Esto es igual a:
if g1 < g2
    h(1:g1) = numPixMax;
    h(g2:256) = numPixMax;
    ngMax = g1-1; % -1 para que devuelva el nivel de gris
    ngMax2 = g2-1;
else

end