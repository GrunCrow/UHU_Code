function [g, numPix] = funcion_calcula_media_region_histograma(h, gIni, gFin)

    numPix = sum(h(gIni:gFin));

    if(numPix>0)
        aux = 0;
        for sub_g = gIni:gFin
            aux = aux + sub_g*h(sub_g);
        end
        g = (aux / numPix) - 1;
    else 
        g = [];
    end
    
end