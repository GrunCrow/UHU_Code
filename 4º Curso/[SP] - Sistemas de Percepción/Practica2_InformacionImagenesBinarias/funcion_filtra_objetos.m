function IbFilt = funcion_filtra_objetos(Ib , numPix)

% donde:
%  Ib: matriz binaria con dos posibles valores, 0’s y 1’s, puede ser tipo
% logical o double.

%  numPix: se eliminarán todas las agrupaciones de 1’s de Ib que tengan un
% área menor a este valor.

%  IbFilt: matriz binaria, de las mismas dimensiones que IbFilt, con dos
% posibles valores, 0’s y 1’s, con el valor 1 indicando las agrupaciones de Ib
% cuya área es mayor o igual a NumPix.

% Observación: para implementar esta función pueden utilizarse o integrarse las
% funciones implementadas en esta práctica.

IbFilt = false(size(Ib));

[Ietiq,N] = funcion_etiquetar(Ib);

areas = funcion_calcula_areas(Ietiq,N);
[~, pos] = sort(areas);

idx = 1;

while idx <= length(areas)
    area = areas(idx);

    if area < numPix
        areas(idx) = [];
        pos(idx) = [];
    else
        idx = idx + 1;
    end

end

% Hasta aqui tenemos las dos mayores areas dentro del vector areas y pos
% nos indica cuales son.

for idx = 1:length(areas)
    % genera 3 valores enteros aleatorios que será el color de la X a
    % etiquetar
    color = [1 1 1];
    IbFilt = IbFilt + logical(funcion_visualiza(Ib,Ietiq == pos(idx), color, false)); 
end






