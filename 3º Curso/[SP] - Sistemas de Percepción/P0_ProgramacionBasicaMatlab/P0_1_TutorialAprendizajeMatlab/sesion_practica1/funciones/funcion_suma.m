function R = funcion_suma(sumando_1, sumando_2, sumando_3)
    
    sumando_1_f = uint8(sumando_1);
    sumando_2_f = uint8(sumando_2);
    sumando_3_f = uint8(sumando_3);

    R = sumando_1_f + sumando_2_f + sumando_3_f ;

end

% funcion_suma(300,20,30) -> 255 porq uint8 -> max = 255