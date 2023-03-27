function  centroides = funcion_calcula_centroides(X,idx)

    numero_agrupaciones = max(idx); % Número de agrupaciones
    centroides = zeros(numero_agrupaciones,3); % Inicializar matriz de centroides
    
    for i = 1:numero_agrupaciones
        centroides(i,:) = mean(X(idx == i,:));
    end