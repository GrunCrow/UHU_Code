function  [idx,centroides] = funcion_kmeans(xColor,numAgrup)
%% 1. Inicialización
% Establece de forma aleatoria K puntos de XColor que actuarán como
% centroides iniciales (semillas). Se usará la función randsample(max,K).
    pos_semilla = randsample(size(xColor,1),numAgrup);
    centroides_semilla = zeros(numAgrup,3);
    for i=1:numAgrup
    centroides_semilla(i,:) = xColor(pos_semilla(i),:);
    end
    % Generar una primera agrupación de los datos (idx_semilla) usando la función
% funcion_calcula_agrupacion
    idx_semilla = funcion_calcula_agrupacion(xColor,centroides_semilla);

%% 2. Repetir Iterativamente
% Calcular los centroides para la idx correspondiente a la iteración
% anterior. Utilizando la función funcion_calcula_centroides.

% Calcula una nueva agrupación a partir de los centroides obtenidos 
% anteriormente usando la función funcion_calcula_agrupacion.

% Compara la agrupación obtenida con la generada anteriormente usando la
% funcion funcion_compara_matrices.

% Sale del bucle si ambas matrices son iguales.

idx_act = idx_semilla;
idx_ant = zeros(size(idx_act));

while(~funcion_compara_matrices(idx_ant,idx_act))

    idx_ant = idx_act;
    centroides = funcion_calcula_centroides(xColor,idx_ant);
    idx_act = funcion_calcula_agrupacion(xColor,centroides);

end

    idx = idx_act;

end