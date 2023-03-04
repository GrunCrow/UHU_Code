function areas = funcion_calcula_areas(IEtiq, N)

% IEtiq, N: información generada con funcion_etiquetar.

% areas: matriz de N filas y una columna (vector fila) con los valores de áreas
% de las agrupaciones de IEtiq almacenados en la posición del vector fila
% correspondiente al valor de las etiquetas.
    
    [numFilas, numCols] = size(IEtiq);

    areas = zeros(1, N);
    
    for etiqueta = 1:N

        contador = 0;
        
        for fila = 1:numFilas
            for col = 1:numCols
                if IEtiq(fila, col) == etiqueta
                    contador = contador + 1;
                end
            end
        end

        areas(etiqueta) = contador;

    end

end