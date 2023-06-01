img_name = "Teoría/Datos/Imagenes/A3.jpg"; I = imread(img_name);

I = uint8(mean(I, 3));


h = imhist(I);


%% min entre max

[hmax, g1] = max(h);

metrica = zeros(256, 1);

for g = 1:256
    metrica(g) = h(g) * ((g - g1)^2);
end

[~, g2] = max(metrica);

if g1 > g2
    aux = g1;
    g1 = g2;
    g2 = aux;
end

hmod= h;

hmod(1:g1) = hmax;
hmod(g2:256) = hmax;

[~, T] = min(hmod);

T = T-1;

Final = zeros(size(I));
Final(I < T) = 1;

figure, subplot(1,2,1), imshow(I_original), subplot(1,2,2), imshow(Final)

%% isodata

umbralparada = 200;
gini = 1; gfin = 256;

% function [g, numPix] = min_entre_max(h, gini, gfin)
    
numpix = sum(h(gini:gfin));

if numpix > 0
    aux = 0;
    for subg=gini:gfin
        aux = aux + h(subg)*subg;
    end

    g = round((aux / numpix) - 1);

else
    g = [];
end

T  = g;

var = false;

while var == false
    
    gini = 1; gfin = T;

    [~,g1] = funcion_calcula_media_region_histograma(h, gini, gfin);

    gini = T+1; gfin = 256;

    [~,g2] = funcion_calcula_media_region_histograma(h, gini, gfin);

    T_nueva = round(mean([g1 g2]));

    if T - T_nueva <= umbralparada
        var = true;
    end
    
end

T = T-1;
