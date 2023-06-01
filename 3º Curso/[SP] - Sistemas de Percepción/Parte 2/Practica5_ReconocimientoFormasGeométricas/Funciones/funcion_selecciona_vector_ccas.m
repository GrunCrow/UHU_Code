function [espacioCcas, JespacioCcas]=funcion_selecciona_vector_ccas(XoI,YoI,dim)

    % El umbral que debe considerar la función es el siguiente:
    umbral = 0.1;
    
    % Obtenemos el 
    [~, numDescriptores] = size(XoI);
    
    valoresJ=zeros(1,numDescriptores);
    
    %% 1. Ranking Individual de Descriptores
    
        for i=1:numDescriptores
            inputs = XoI(:,i);
            valoresJ(1,i) = indiceJ(inputs,YoI');
        end
    
    %% 2. Preselección de Características.
        %Solo elegimos las que tienen un valor superior al umbral.
        indices = 1:23;
        indices = indices(valoresJ>=umbral);
        valoresJ = valoresJ(valoresJ>=umbral);
    
    %% Selección del vector de características de dimensión dim.
    
        combinaciones = combnk(indices,dim);
        [numeroCombinaciones, ~]=size(combinaciones);
        Jaux = zeros(numeroCombinaciones,1);
        %Para cada combinación calculamos su separabilidad...
        for i=1:numeroCombinaciones
            espacio=combinaciones(i,:);  
            X=XoI(:,espacio);
            Jaux(i,1) = indiceJ(X,YoI);
        end
    
    
        % Nos quedamos con el grado de separabilidad máximo
       [JespacioCcas, indMaximo]=max(Jaux);
        
       
        espacioCcas=combinaciones(indMaximo,:);
        
end