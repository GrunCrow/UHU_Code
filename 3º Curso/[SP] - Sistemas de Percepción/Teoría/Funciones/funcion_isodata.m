function T = funcion_isodata(I,UmbralParada)
    
%     img_name = "Teoría/Datos/Imagenes/A1.jpg"; I = imread(img_name);
% 
%     I = uint8(mean(I, 3));

    h = imhist(I);
    gIni = 1; gFin = 256;
    
    [T, ~] = funcion_calcula_media_region_histograma(h,gIni,gFin);
    var = false;
    while(var == false)
        
        gIni = 1; gFin=T;
        [g1, ~] = funcion_calcula_media_region_histograma(h,gIni,gFin);
    
        gIni = T+1; gFin = 256;
        [g2, ~] = funcion_calcula_media_region_histograma(h,gIni,gFin);
        T_nueva = round(mean([g1 g2]));
    
        if(abs(T-T_nueva) <= UmbralParada)
            var = true;
        end
        T = T_nueva;
    
    end
    
    T = T - 1;


end