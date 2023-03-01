function varLogica = funcion_compara_matrices(m1,m2)
    % Diseñar una función que reciba como entradas dos matrices de la misma
    % dimensión. La función debe devolver una variable lógica, con true si las
    % matrices son iguales y false  en caso contrario.
    % Para ello la función deberá:
    % - Calcular una matriz diferencias (resta de las dos matrices de entrada)
    % - Calcula el valor máximo y mínimo de esta matriz diferencias
    % - Si el valor máximo es igual al valor mínimo y cualquiera de ellos tiene
    % el valor 0, entonces las matrices de entrada son iguales
    
    if size(m1) ~= size(m2)
        
        display('Matrices de diferente dimension');

    else

        varLogica = false;
    
        aux = double(m1) - double(m2); % si operamos con imagenes estara en ui8 y hay q poner double para que no de error
    
        mini = min(min(aux));
        maxi = max(max(aux));
    
        if mini == maxi && maxi == 0
            varLogica = true;
        end
    end


end