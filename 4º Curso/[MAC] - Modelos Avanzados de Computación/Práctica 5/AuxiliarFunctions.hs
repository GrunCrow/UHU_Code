module AuxiliarFunctions(
	next,
	next_float,
	toInt,
	error_code
) where

--next_float :: Int -> Int -> Float
next_float x y = ((x+y) / 2.0)

next :: Int -> Int -> Int
next x y = div (x+y) 2

toInt :: Float -> Int
toInt x = round x

-- ERRORES:
-- 1: Numero fuera de los limites por abajo (<0)
-- -1: Numero fuera de los limites por arriba (>100)
-- 0: Palabra introducida no dentro de las ordenes

error_code code = 
	if (code == 0) then print $ "Error, introduzca 'mayor', 'menor' o 'encontrado'"
	else if (code == (-1)) then print $ "Error, el numero no puede ser menor de 0"
	else if (code == 1) then print $ "Error, el numero no puede ser mayor de 100"
	else print $ "Codigo de error no contemplado"