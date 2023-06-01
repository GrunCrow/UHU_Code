function gumbral = funcion_otsu(I)

    h = imhist(I);
    
    [filas, columnas, dimensiones] = size(I);
    numPix = filas * columnas * dimensiones;
    valoresgris = 1:256;
    c = valoresgris * h;
    g = round(c / numPix);
    
    varianzas = zeros(256, 1);

    for i = 2 : 255
        numPix1 = 0;
        numPix2 = 0;
        c1 = 0;
        c2 = 0;
        for i1 = 1 : i
            c1 = c1 + i1 * h(i1);
            numPix1 = numPix1 + h(i1);
        end
        for i2 = i + 1 : 256
            c2 = c2 + i2 * h(i2);
            numPix2 = numPix2 + h(i2);
        end

        w1 = numPix1 / numPix;
        w2 = numPix2 / numPix;

        g1 = round(c1 / numPix1);
        g2 = round(c2 / numPix2);

        varianzas(i) = w1 * (g1 - g) .^2 + w2 * (g2 - g) .^2;

    end

    
    [~, gumbral] = max(varianzas);
    gumbral = gumbral - 1;
  
end