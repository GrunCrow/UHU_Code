function [Ib, IEtiq] = vecinos(Ib, IEtiq, fila, col, N)

    [numFilas, numCols] = size(IEtiq);
    
    % si el pixel tiene valor = 1, hay que etiquetarlo
    if Ib(fila, col) == 1
        Ib(fila, col) = 0; % marcar la casilla que vamos a marcar a 0
        IEtiq(fila, col) = N;
        
        % vecindad 4 -> una cruz del pixel centra a arriba, abajo, izq y
        % dcha, la comprobacion lo que hace es coger el pixel de, por ej,
        % primer caso, si es la primera fila, entonces no tendrá pixeles
        % por arriba, se hace esta constraint para todo y segun si es borde
        % o no va para arriba o abajo

        % para vecindad 8 habría que incluir 4 nuevos ifs paar hacer lo
        % mismo con las esquinas (ej fila izq arriba habria que hacer
        % fila-1, col-1...

        if(fila > 1)
            % comprueba vecinos
            [Ib, IEtiq] = vecinos(Ib, IEtiq, fila-1, col, N);
        end

        if(fila < numFilas)
            [Ib, IEtiq] = vecinos(Ib, IEtiq, fila+1, col, N);
        end

        if(col > 1)
            [Ib, IEtiq] = vecinos(Ib, IEtiq, fila, col-1, N);
        end

        if(col < numCols)
            [Ib, IEtiq] = vecinos(Ib, IEtiq, fila, col+1, N);
        end
    end




end