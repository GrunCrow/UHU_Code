% etiquetar
function [IEtiq, N] = funcion_bwlabel(Ib) 

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
    
%     N = 0;

    IEtiq = zeros(size(Ib));
    
    % recorre de arriba a abajo
%     for fila = 1:numFilas
%         % recorre de izqda a derecha
%         for col = 1:numCol
%             if Ib(fila, col) == 1
%                 N = N + 1;
%                 [Ib, IEtiq] = vecinos(Ib, IEtiq, fila, col, N);
%             end
%         end
%     end
    
    % Pixeles a nivel alto en la Ib
    numOnes = sum(Ib(:));
    
    % Para la imagen de salida, ponerle a 1 los pixeles de nivel alto de la
    % Ib
    IEtiq((Ib == 1)) = 1:numOnes;

    etiquetas = [zeros(1,numCol+2);zeros(numFilas,1),IEtiq,zeros(numFilas,1);zeros(1,numCol+2)];

    cambio = true;
    while(cambio == true)
        cambio = false;

        %% Pasada de arriba-abajo
        for fila=1:numFilas        
            for columna=1:numCol
                if(IEtiq(fila,columna) ~= 0)
                    % Elegir la etiqueta mínima de sus vecinos.
                    V = unique(vecinos(etiquetas,fila+1,columna+1));
                    V = V(V ~= 0);
                    minima_etiqueta = min(V);
                    if(minima_etiqueta ~= IEtiq(fila,columna))
                        cambio = true;
                        IEtiq(fila,columna) = minima_etiqueta;
                        etiquetas(fila+1,columna+1) = minima_etiqueta;
                    end
    
                end
            end
        end
        
        %% Pasada de abajo-arriba
        for fila=numFilas:-1:1                 
            for columna=numCol:-1:1
                if(IEtiq(fila,columna) ~= 0)
                    % Elegir la etiqueta mínima de sus vecinos.
                    V = unique(vecinos2(etiquetas,fila+1,columna+1));
                    V = V(V ~= 0);
                    minima_etiqueta = min(V);
                    if(minima_etiqueta ~= IEtiq(fila,columna))
                        cambio = true;
                        IEtiq(fila,columna) = minima_etiqueta;
                        etiquetas(fila+1,columna+1) = minima_etiqueta;
                    end
                end
            end
        end

    end


    %% Eliminar las columnas y filas añadidas artificialmente.
    % Sacar valores únicos que la matriz etiquetada
    N = unique(IEtiq);

    % Eliminar el 0 de esos valores
    N = N(N >0);

    % Asignar etiquetas de 1:N
     for i=1:size(N,1)
         IEtiq(IEtiq == N(i)) = i; % Para cada valor de la etiqueta le reasigno un valor de 1 hasta el número de valores que existan
     end

end

function V8 = vecinos_v8(IEtiq,fila,columna)
     V8 = [IEtiq(fila-1,columna-1:columna+1),IEtiq(fila,columna-1:columna)];  % Vecindad Tipo 8 (Primera pasada)
end

function V8 = vecinos2_v8(IEtiq,fila,columna)
     V8 = [IEtiq(fila+1,columna-1:columna+1),IEtiq(fila,columna:columna+1)];  % Vecindad Tipo 8 (Segunda pasada)
end

function V4 = vecinos_v4(IEtiq,fila,columna)
     V4 = [IEtiq(fila-1,columna-1),IEtiq(fila,columna-1)];       % vecindad Tipo 4 (Primera pasada)
end

function V4 = vecinos2_v4(IEtiq,fila,columna)
     V4 = [IEtiq(fila+1,columna),IEtiq(fila,columna+1)];         % Vecindad Tipo 4 (Segunda pasada)
end


%% Funciones principales de vecindad

function V = vecinos(IEtiq,fila,columna)
     V = vecinos_v8(IEtiq,fila,columna);
%      V = vecinos_v4(IEtiq,fila,columna);
end

function V = vecinos2(IEtiq,fila,columna)
     V = vecinos2_v8(IEtiq,fila,columna);
%      V = vecinos2_v4(IEtiq,fila,columna);
end