function d = distancia(A,B)
    if(size(A,2) == size(B,2))
        d = sqrt (sum((A-B).^2));
    else
        fprintf("Los parámetros deben tener las mismas dimensiones.\n");
end