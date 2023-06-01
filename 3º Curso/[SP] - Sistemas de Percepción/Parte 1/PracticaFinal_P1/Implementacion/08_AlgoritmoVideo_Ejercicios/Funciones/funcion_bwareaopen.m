function IbFilt = funcion_bwareaopen(Ib , numPix)

% - Ib: matriz binaria con dos posibles valores, 0 s y 1’s, puede ser tipo
% logical o double.

% - numPix: se eliminarán todas las agrupaciones de 1 s de Ib que tengan un
% área menor a este valor.

% - IbFilt: matriz binaria, de las mismas dimensiones que IbFilt, con dos
% posibles valores, 0’s y 1’s, con el valor 1 indicando las agrupaciones de Ib
% cuya área es mayor o igual a NumPix.

    % Inicializar matriz de salida del mismo tamaño que Ib
    IbFilt = zeros(size(Ib));
    
    % Etiquetar imagen binaria
    [Ietiq,N] = funcion_bwlabel(Ib);
    
    % Calcular area
    areas = funcion_regionprops_area(Ietiq,N);
    
    [sortedAreas, pos] = sort(areas);


    

    % idx = 1;
    % while idx <= length(areas)
    %     area = areas(idx);
    % 
    %     if area < numPix
    %         areas(idx) = [];
    %         pos(idx) = [];
    %     else
    %         idx = idx + 1;
    %     end
    % 
    % end

    % Etiquetas de los objetos con áreas mayores o iguales a numPix
    etiquetas = pos(sortedAreas>=numPix);
    
    % Para cada etiqueta
    for idx = 1:size(etiquetas,2)
        % Añadir el objeto con etiqueta i a la matriz filtrada
        IbFilt = IbFilt + (Ietiq == etiquetas(1,idx));
    end


end



