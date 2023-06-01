function T = funcion_otsu(I)
    % Calculamos el histograma de la imagen
    h = imhist(uint8(I));

    % Definimos el rango de niveles de gris a considerar
    gIni = 1; gFin = 256;
    
    % Calculamos el umbral medio y el número de píxeles en la imagen
    [G, numPix] = funcion_calcula_media_region_histograma(h, gIni, gFin);

    % Inicializamos un vector de varianzas
    var = zeros(256,1);

    % Calculamos la varianza entre clases para cada posible umbral
    for g = 2:256
        T = g;
        var(g) = calcula_varianza_entre_clases(T, h, numPix, G);
    end
    
    % Encontramos el umbral que maximiza la varianza
    [~, T] = max(var);
    
    % Convertimos el rango de 1..256 a 0..255
    T = T - 1;
end
