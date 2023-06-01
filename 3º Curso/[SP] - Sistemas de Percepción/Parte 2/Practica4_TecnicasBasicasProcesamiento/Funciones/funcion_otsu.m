function T_fin = funcion_otsu(I)

    h = imhist(uint8(I));
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
    [~, indice] = max(var);
    
    %Convertimos el rango de 1..256 a 0..255
    T_fin = indice - 1;

end