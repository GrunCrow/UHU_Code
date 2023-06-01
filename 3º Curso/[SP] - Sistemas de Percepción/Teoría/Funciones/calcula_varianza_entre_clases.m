function var = calcula_varianza_entre_clases(g, h, numPix, gmedio)
    gIni = 1;
    gFin = g;
    
    % Valor de gris medio de la primera clase
    [gmedio1, numPix1] = funcion_calcula_media_region_histograma(h, gIni, gFin);

    gIni = g+1;
    gFin = 256;
    
    % Valor de gris medio de la segunda clase
    [gmedio2, numPix2] = funcion_calcula_media_region_histograma(h, gIni, gFin);
    

    if numPix1 * numPix2 == 0
        var = 0;
    else % nunmPix1 * numPix2 > 0
        % Probabilidad de ocurrencia de la primera clase
        w1 = numPix1/numPix;
        % Probabilidad de ocurrencia de la segunda clase
        w2 = numPix1/numPix;
        
        % Varianza entre clases
        var = w1*((gmedio1-gmedio)^2) + w2*((gmedio2-gmedio)^2);

    end

end