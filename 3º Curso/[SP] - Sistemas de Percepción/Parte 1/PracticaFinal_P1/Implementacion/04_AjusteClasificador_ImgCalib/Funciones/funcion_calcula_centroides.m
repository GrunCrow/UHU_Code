function  centroides = funcion_calcula_centroides(X,idx)

    numero_agrupaciones = idx;
    centroides = zeros(numero_agrupaciones,3);
    
    for i = 1:numero_agrupaciones
        centroides(i,:) = mean(X(idx == i,:));
    end

end