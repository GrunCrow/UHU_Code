% Función que compara dos matrices de la misma dimension
% Salida: true o false, dependiendo si las matrices son iguales o distintas

% Metodología: 
% - Calcular una matriz diferencias (resta de las dos matrices de entrada)
% - Calcular el valor máximo y mínimo de esta matriz diferencias
% - Si el valor máximo es igual al valor mínimo y cualquiera de ellos tiene
% el valor 0, entonces las matrices de entrada son iguales

% Observación: si las matrices no tienen la misma dimensión la función
% únicamente debe advertir por el command window este hecho (para ello,
% puedes utilizar la función instrucción: disp('cadena de texto a mostrar').

function varLogica = funcion_compara_matrices(m1,m2)
    
    % comprobamos dimensiones
    
    [numFilas_m1 , numColumas_m1] = size(m1);
    [numFilas_m2 , numColumas_m2] = size(m2);
    
    if (numFilas_m1 ~= numFilas_m2) || (numColumas_m1 ~= numColumas_m2)
        clc
        disp('Las matrices no son iguales')
        varLogica = []; % por devolver algo en este caso
        
    else % sólo entra si las matrices  son iguales
        
        clc

        m1 = double(m1); % para asegurar que hacemos la diferencia en el  formato adecuado
        m2 = double(m2);

        dif = m1-m2;

        vMin = min(dif(:));
        vMax = max(dif(:));

        if vMin==vMax && vMin==0
            varLogica = true;
            disp ('matrices iguales')
        else
            varLogica = false;
            disp ('matrices diferentes')            
        end
        
    end


end