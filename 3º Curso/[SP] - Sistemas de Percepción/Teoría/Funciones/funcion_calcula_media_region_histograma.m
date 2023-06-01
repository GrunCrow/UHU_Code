function [g, numPix] = funcion_calcula_media_region_histograma(h,gIni,gFin)
    %     nº de pixeles con el nivel de intensidad entre gini y gfin
    numPix = sum(h(gIni:gFin));
    %     si hay pixeles con el nv de gris entre esos valores 
    if(numPix>0)
        aux = 0;
        %         para cada g dentro del rango de grises
        for g = gIni:gFin
            aux = aux + g*h(g);
        end
        g = (aux / numPix) - 1;
%     si no, no devuelve ná
    else 
        g = [];
    end

    g = round(g);
    
end