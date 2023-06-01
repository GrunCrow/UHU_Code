function [espacioCcas, JespacioCcas] = funcion_selecciona_vector_ccas_por_nombre_descriptores(XoI, YoI, nombreDescriptores, descriptores_seleccionados)

    % Los descriptores específicos que deseas seleccionar vendrán dados
    % como:
    % descriptores_seleccionados = ["DF3", "DF7", "Hu3"];

    % Obtenemos los nombres de los descriptores disponibles
%     nombreDescriptores = { 
%         'Compacticidad', 
%         'Excentricidad', 
%         'Solidez_CHull(Solidity)', 
%         'Extension_BBox(Extent)', 
%         'Extension_BBox(Invariante Rotacion)', 
%         'Hu1', 
%         'Hu2', 
%         'Hu3', 
%         'Hu4', 
%         'Hu5', 
%         'Hu6', 
%         'Hu7', 
%         'DF1', 
%         'DF2', 
%         'DF3', 
%         'DF4', 
%         'DF5', 
%         'DF6', 
%         'DF7', 
%         'DF8', 
%         'DF9', 
%         'DF10', 
%         'NumEuler'};
    
    % Obtenemos los índices de los descriptores seleccionados
    indices_descriptores = [];
    for i = 1:numel(descriptores_seleccionados)
        indice = find(strcmp(nombreDescriptores, descriptores_seleccionados(i)));
        indices_descriptores = [indices_descriptores, indice];
    end

    % Seleccionamos los descriptores correspondientes a los índices
    XoI = XoI(:, indices_descriptores);

    % Calculamos el índice J para los descriptores seleccionados
    JespacioCcas = indiceJ(XoI, YoI');
    
    % Espacio de características es igual a los índices de los descriptores seleccionados
    espacioCcas = indices_descriptores;
end
