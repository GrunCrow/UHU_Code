function Ib = calcula_deteccion_multiples_esferas_en_imagen(I,radios,centroides)

 % 6.    funcion -> calcula_deteccion_multiples_esferas_en_imagen ->
 %       Ibfinal = Ib1 OR ib2 OR ib3;

    Ib = calcula_deteccion_1esfera_en_imagen(I,radios(1),centroides(1,:));
    for i=2:size(radios,1)
    
    Ib = (Ib | calcula_deteccion_1esfera_en_imagen(I,radios(i),centroides(i,:)));
        
    end


end