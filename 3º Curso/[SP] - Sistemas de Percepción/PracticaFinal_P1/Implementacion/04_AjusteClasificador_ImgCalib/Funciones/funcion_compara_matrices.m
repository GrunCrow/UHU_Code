% Función: varLogica = funcion_compara_matrices(m1,m2)

% Diseñar una función que reciba como entradas dos matrices de la misma
% dimensión. La función debe devolver una variable lógica, con true si las
% matrices son iguales y false  en caso contrario.
% Para ello la función deberá:
% - Calcular una matriz diferencias (resta de las dos matrices de entrada)
% - Calcula el valor máximo y mínimo de esta matriz diferencias
% - Si el valor máximo es igual al valor mínimo y cualquiera de ellos tiene
% el valor 0, entonces las matrices de entrada son iguales

% Observación: si las matrices no tienen la misma dimensión la función
% únicamente debe advertir por el command window este hecho (para ello,
% puedes utilizar la función display('cadena de texto a mostrar').

% Guardar la función en un directorio llamado funciones, y, añadiendo el
% path a este directorio, llámala en distintas situaciones para comprobar
% su correcto funcionamiento.

function var = funcion_compara_matrices(m1,m2)
    if (size(m1) == size(m2))

        m1 = double(m1); % Es importante para que los números no
        m2 = double(m2); % se desborden.

        var = true;
        diferencia = m1 - m2;
        maximo = max(diferencia(:));
        minimo = min(diferencia(:));
        if ((maximo == minimo) & (maximo == 0 | minimo == 0))
            %fprintf("Las matrices son iguales.\n")
        else
            var = false;
            %fprintf("Las matrices no son iguales.\n");
        end

    else
        var = false;
        %fprintf("Las matrices no tienen la misma dimensión.\n");
    end
end