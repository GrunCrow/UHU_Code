function T = funcion_isodata(I,UmbralParada)

h = imhist(I);
gIni = 1; gFin = 256;

[~,T] = funcion_calcula_media_region_histograma(h,gIni,gFin);
var = false;
while(var == false)
    
    gIni = 1; gFin=round(T);
    [~,g1] = funcion_calcula_media_region_histograma(h,gIni,gFin);

    gIni = round(T)+1; gFin = 256;
    [~,g2] = funcion_calcula_media_region_histograma(h,gIni,gFin);
    T_nueva = mean([g1 g2]);

    if(abs(T-T_nueva) <= UmbralParada)
        var = true;
    end
        T = T_nueva;

end

    T = T - 1;


end