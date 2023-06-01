function Ib = calcula_deteccion_1esfera_en_imagen(I,radio,centroide)

    R = double(I(:,:,1));
    G = double(I(:,:,2));
    B = double(I(:,:,3));

    MD = sqrt((R-centroide(1)).^2 + (G-centroide(2)).^2 + (B-centroide(3)).^2);
    Ib = MD < radio;
end