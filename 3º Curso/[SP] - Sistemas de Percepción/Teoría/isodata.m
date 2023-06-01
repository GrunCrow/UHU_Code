img_name = "Teoría/Datos/Imagenes/A1.jpg"; I = imread(img_name);

I = uint8(mean(I, 3));

h = imhist(I);

frecuencias = h(:);
x = 0:255;
T = sum(frecuencias .* h) / sum(h);

uint8(mean(h));