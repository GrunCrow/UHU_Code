
%% Umbralización

% Leer imagen
I = imread("A1.jpg");

% Clasificar
[Ib_Etiq s] = bwlabel();

% Coger el elemento deseado

% Binarizar

% Borde
% perimetro de imagen etiquetada = regionprops -> no solo da el centroide

stats = regionprops(Ib_Etiq, "Area", "Perimeter", "Circularity");
Areas = cat(1, stats.Area);

figure,
subplot(1,2,1), imshow(img)
subplot(1,2,2), imshow()


%% Creación clasificador basado en regla de decisión teórica




%% Histogramas

I = uint8([0 1 5 0; 2 2 2 5]);
imhist(I);
h = imhist(I);
stem(0:5,h(1:6),'.r'), grid on

% Calcular el vector medio a partir del vector I:
% Suma de todos los niveles de grises de los px
aux = 0*h(1)+1*h(2)+2*h(3)+3*h(4)+4*h(5)+5*h(6);
% dividirlo por en num (8)
aux = aux/8;



% Automáticamente sería de la siguiente manera, en un bucle for
numPix = sum(h(:));
conteo = 0;
varianza = 0;

for i = 1:256
    conteo = conteo + i * h(i);
    varianza = (varianza + (i))^2 * h(i);
end

% conteo está incrementado 1 porque empezamos en 0 y no en 1, por lo que la
% unidad de grises va 1 unidad por encima

valorMedio = conteo / sum(h);
varianza = varianza / 8;

% Varianza
% (0-valorMedio)^2+(1-valorMedio)^2+(5-valorMedio)^2+(0-valorMedio)^2+(2-valorMedio)+(2-valorMedio)^2+(2-valorMedio)^2+(5-valorMedio)^2 / 8...

varianza = var(double(I(:)))


