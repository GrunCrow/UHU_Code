function centroides = funcion_regionprops_centroid(IEtiq, N)

% Esta función toma como entrada la matriz de etiquetas Ietiq y el número total 
% de etiquetas N, y devuelve una matriz centroides que contiene las coordenadas (x,y) 
% del centroide de cada objeto etiquetado.
% 
% La función recorre cada etiqueta utilizando un bucle for. Dentro del bucle, 
% utiliza la función find para obtener las coordenadas (fila, columna) de todos 
% los píxeles con la etiqueta actual. Luego, utiliza la longitud de estas coordenadas 
% para calcular el número total de píxeles en la etiqueta.
% 
% A continuación, se calculan las coordenadas (x,y) del centroide de la etiqueta 
% actual dividiendo la suma de las coordenadas de todos los píxeles por el número 
% total de píxeles.
% 
% Finalmente, se almacenan las coordenadas del centroide de la etiqueta actual en la 
% matriz centroides. La función devuelve la matriz centroides completa una vez que ha 
% recorrido todas las etiquetas.
    
     % Inicializar la matriz de coordenadas (x,y) de cada objeto a 0
    centroides = zeros(size(N,1), 2);
    
    % Recorre las etiquetas (de 1 al num de objetos de la img)
    for i = 1:size(N,1)
        [fila, col] = find(IEtiq == i);
%         numPixeles = length(fila);
        
        % Calcula el centroide de la etiqueta actual
%         x = sum(col) / numPixeles;
%         y = sum(fila) / numPixeles;
        x = mean(col);
        y = mean(fila);
        
        centroides(i, :) = [x, y];
    end
end