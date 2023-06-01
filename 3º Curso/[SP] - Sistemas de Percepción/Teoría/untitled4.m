img_name = "Teoría/Datos/Imagenes/A1.jpg"; I = imread(img_name);

I = uint8(mean(I, 3));

h = imhist(I);

% Dado un histograma h, se fija un umbral K y divide el histograma en dos
% clases (g1 y g2)
gIni = 1; gFin = 256;

[G, numPix] = funcion_calcula_media_region_histograma(h,gIni,gFin);

var = zeros(256,1);

% Para cada nivel de gris se realiza la varianza entre clases
for g = 2:256
    T = g;
    var(g) = calcula_varianza_entre_clases(T,h,numPix,G);
end

% Nos quedamos con el valor de k que nos maximice la varianza.
[~, T] = max(var);

%Convertimos el rango de 1..256 a 0..255
T = T - 1;

Final = zeros(size(I));
Final(I > T) = 1;

imshow(Final)