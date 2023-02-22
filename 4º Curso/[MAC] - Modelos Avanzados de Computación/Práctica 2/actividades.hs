{--------------------------------------------}

-- 1 cambia_el_primero(a,b): cambia el primer valor de la lista b por el valor de a
--function declaration
esprimo :: Int -> Bool
--function definition 
esprimo a = length (lista_divisores a a) == 2


lista_divisores :: Int -> Int -> [Int]

lista_divisores x y = filter (\z -> mod x z == 0) (take y (iterate (+1) 1))

-- Hugs> :reload		

{--------------------------------------------}
-- unico: elimina los elementos repetidos

-- unico :: [String] -> [String]
unico [] = []
unico list = head list : (unico (filter (\x -> x /= (head list)) list))
--			filtra para cada elemento que no sea igual a la cabecera de la lista


{--------------------------------------------}

