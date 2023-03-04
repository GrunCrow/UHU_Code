function h = funcion_histograma(I)
    
    I  = double(I);

    % Dimensiones de la imagen
    [m, n] = size(I);

    h = zeros(256,1); % Inicializar histograma con 255 valores porque son los valores que puede tener una img
    
    for i = 1:m
        for j = 1:n
            valor = I(i,j); % Obtener valor del píxel
            h(valor + 1) = h(valor + 1) + 1; % Añadir 1 al valor de pixel correspondiente
        end
    end
    
end