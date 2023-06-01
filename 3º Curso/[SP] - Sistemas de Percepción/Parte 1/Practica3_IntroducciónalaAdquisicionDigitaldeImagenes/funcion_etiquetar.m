function [IEtiq, N] = funcion_etiquetar(Ib) 

% donde:
%  Ib: matriz binaria con dos posibles valores, 0’s y 1’s, puede ser tipo logical
% o double.

%  N: número de agrupaciones conexas de 1’s presentes en la Ib, atendiendo a
% conectividad tipo 4.

%  IEtiq: matriz tipo double, de las mismas dimensiones que Ib, con N+1
% posibles valores, 0 para identificar los 0’s de Ib y valores de etiqueta de 1 a N
% (números enteros) para para identificar los píxeles de las agrupaciones conexas 1’s
% detectadas en Ib.

% hacer con vecindad 4, puede cambiar a tipo 8 u otro tipo (preparar y
% dejar ya hecho)

% inicialización de cada píxel de valor 1 a una única etiqueta”
    
    [numFilas, numCol] = size(Ib);
    
    N = 0;

    IEtiq = zeros(size(Ib));
    
    % recorre de arriba a abajo
    for fila = 1:numFilas
        % recorre de izqda a derecha
        for col = 1:numCol
            if Ib(fila, col) == 1
                N = N + 1;
                [Ib, IEtiq] = vecinos(Ib, IEtiq, fila, col, N);
            end
        end
    end

end