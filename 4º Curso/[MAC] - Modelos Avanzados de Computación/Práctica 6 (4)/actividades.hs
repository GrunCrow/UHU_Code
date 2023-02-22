{--------------------------------------------}

-- 1 cambia_el_primero(a,b): cambia el primer valor de la lista b por el valor de a
--function declaration
--esprimo :: Int -> Bool
--function definition 
--esprimo a = length (lista_divisores a a) == 2


--lista_divisores :: Int -> Int -> [Int]

--lista_divisores x y = filter (\z -> mod x z == 0) (take y (iterate (+1) 1))

-- Hugs> :reload		

{--------------------------------------------}

-- factorial guardar
--function declaration

--function definition 
factorial_guarda :: (Num a, Ord a) => a -> a
factorial_guarda n
	| n == 0 = 1
	| n > 0 = n * factorial_guarda(n-1)
	| otherwise = error "valor negativo"
	
	
-- signo
--function declaration
signo::Integer->Bool
--function definition 
signo n
	| n >= 0 = True
	| n < 0 = False
	
{- Factorial IF THEN ELSE -}
--function declaration
factorialIF :: Num a => a -> a

--function definition
factorialIF n = if (n == 0) then 1 else n*factorialIF(n-1)

-- intervalo:: Integer -> Int
intervalo a b n = if ((a < n) && (n < b)) then True else False

--intervalo x =
	--if x > 75 then "Intervalo 4"
	--else if 50 < x < 75 then "Intervalo 3"
	--else if 25 < x < 50 then "Intervalo 2"
	--otherwise = error "menor de 25"
	
case_par :: Integral a => a -> Bool
case_par n = case (mod n 2 == 0) of
					True->True
					False -> False
			
sumar x y = x + y
restar x y = x - y				
operar x = case x of
	1 -> sumar
	2 -> restar
	
{-------------------------------------------------------------}

lista_vacia :: [a] -> String
lista_vacia list = "Resultado: " ++ case list of
	[]	-> "Lista vacia"
	(x:[]) -> "Lista con un elemento"
	(x:y:[]) -> "Lista con dos elementos"
	(x:y:_) -> "Lista con mas de dos elementos"

--lista_vacia :: [Integer] -> Integer
--lista_vacia list = case (length list == 0) of
	--True -> 0
	--False -> length list

{-------------------------------------------------------------}

-- Dada una lista de enteros, devuelve una lista de los sucesores de cada entero
-- Si pasan [4 5] devuelve [5 6]
-- controlar si lista vacia
lista_sucesores :: [Integer] -> [Integer]
lista_sucesores [] = []
lista_sucesores (x:xs) = (x+1) : lista_sucesores xs
--lista_sucesores list = if (length list == 0) -> error "lista vacia" 

-- Dada una lista de enteros, devuelve una lista con los elementos que son positivos
lista_positivos :: [Integer] -> [Integer]
lista_positivos [] = []
lista_positivos (x:xs) = if x >= 0 then x : lista_positivos xs else lista_positivos xs

-- Definir la funcion until tal que until p f x aplica la f a x el menor numero posible de veces, hasta alcanzar un valor que satisface el preficado p. until (>1000) (2*) 1 =>1024
-- until2 (>1000) (+2) 1 -> 2* resultado hasta que el resultado sea >1000

-- hasta :: (a -> Bool) -> (a -> a) -> a -> a
until2 condicion operacion comienzo = if comienzo > operacion then comienzo
else until2 condicion operacion (operacion comienzo)