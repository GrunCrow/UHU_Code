function YTest = funcion_knn(XTest, XTrain, YTrain, k, tipoDistancia)
    numMuestrasTest = size(XTest, 1);
    numMuestrasTrain = size(XTrain, 1);
    numDescriptores = size(XTrain, 2);
    YTest = zeros(numMuestrasTest, 1);
    
    for i = 1:numMuestrasTest
        % 1.- CÁLCULO DEL VECTOR DISTANCIAS ENTRE LA INSTANCIA DE TEST Y TODAS LAS
        % INSTANCIAS DE TRAIN
        diferencia = repmat(XTest(i, :)', 1, numMuestrasTrain) - XTrain';
        
        if strcmpi(tipoDistancia, 'Euclidea')
            distancia = sqrt(sum(diferencia.^2, 1));
        elseif strcmpi(tipoDistancia, 'Manhattan')
            distancia = sum(abs(diferencia), 1);
        else % si no es una string valida, se ejecuta con euclidea
            distancia = sqrt(sum(diferencia.^2, 1));
        end
        
        % 2.- LOCALIZAR LAS k INSTANCIAS DE XTrain MAS CERCANAS A LA INSTANCIA DE
        % TEST BAJO CONSIDERACIÓN
        [~, indices] = sort(distancia);
        k_indices_mas_cercanos = indices(1:k);
        
        % 3.- CREAR UN VECTOR CON LAS CODIFICACIONES DE LAS CLASES DE ESAS
        % k-INSTANCIAS MÁS CERCANAS
        codificaciones = YTrain(k_indices_mas_cercanos);
        
        % 4.- ANALIZAR ESE VECTOR PARA CONTAR EL NÚMERO DE VECES QUE APARECE
        % CADA CODIFICACIÓN PRESENTE EN EL VECTOR (unique del vector)
        [vector_indices, ~, indice_unica] = unique(codificaciones);
        contador = histcounts(indice_unica, numel(vector_indices));
        
        % 5.- EL VALOR DE YTEST EN LA POSICIÓN CORRESPONDIENTE A LA INSTANCIA DE
        % XTEST QUE SE ESTÁ ANALIZANDO ES LA CODIFICACIÓN DE LA CLASE MÁS NUMEROSA.
        % - SI HAY MÁS DE UNA CLASE CON EL NÚMERO MÁXIMO DE VOTOS, DEVOLVER LA
        % CLASE DE LA INSTANCIA MÁS CERCANA A LA DE TEST (ENTRE ESAS INSTANCIAS
        % DE LAS CLASES MÁS NUMEROSAS)
        [valorMaximo, claseClasificada] = max(contador);
        clases_empate = find(contador == valorMaximo);
        
        if numel(clases_empate) > 1
            [~, indice_cercano] = min(distancia(k_indices_mas_cercanos(clases_empate)));
            claseClasificada = clases_empate(indice_cercano);
        end
        
        YTest(i) = vector_indices(claseClasificada);
    end
end
