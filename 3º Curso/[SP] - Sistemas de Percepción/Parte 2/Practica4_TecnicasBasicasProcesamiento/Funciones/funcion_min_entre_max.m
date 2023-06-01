function T = funcion_min_entre_max(I)

    h = imhist(uint8(I));

    [hMax,g1] = max(h);
    
    metrica = zeros(256,1);
    
    % Consigue los dos valores más altos de niveles de gris en un histograma
    % bimodal y desbalanceado.
    
    for g=1:256
        metrica(g) = h(g)*((g - g1)^2);
    end
    
    %% Consigue el segundo nivel de gris
    [~,g2] = max(metrica);
    
    hmod = h;
    
    aux = g1;
    
    if (g1 > g2) 
    
        g1 = g2;
        g2 = aux;
    
    end
    
    % g1 es el menor y g2 es el mayor.
    hmod(1:g1) = hMax;
    hmod(g2:256) = hMax;
    
    %Devuelve el valor minimo entre las dos contribuciones.
    [~,T] = min(hmod);
    
    T = T - 1;
end