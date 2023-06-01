img_name = "Teoría/Datos/Imagenes/A1.jpg"; I = imread(img_name);

I = uint8(mean(I, 3));

h = imhist(I);

[hMax, g1] = max(h);

metricas = zeros(size(256,1));

for g = 1:256
    metricas(g) = h(g) * (g - g1)^2;
end

[~, g2] = max(metricas);

hmod = h;

aux = g1;

if g1 > g2
    g1 = g2;
    g2 = aux;
end

hmod(1:g1) = hMax;
hmod(g2:256) = hMax;

[~, T] = min(hmod);

T = T - 1;

Final = zeros(size(I));
Final(I > T) = 1;

imshow(Final);