function h = funcion_histograma_gris(I)
    
    % Dimensiones de la imagen
    [m, n] = size(I);

    h = zeros(256,1); % Inicializar histograma con 255 valores porque son los valores que puede tener una img
    
    for valor = 0:255 % Recorrer cada posible nivel de gris
        h(valor+1) = sum(sum(I == valor)); % Contar píxeles con ese valor
    end

end