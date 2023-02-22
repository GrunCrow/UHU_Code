--cambia_el_primero(a,b): cambia el primer valor de la lista a por el valor de a
--cambia_el_n(a,n,b): cambia el valor de la posicion n de la lista a por el valor de a
--get_mayor_abs(a): devuelve el mayor numero en valor absoluto de la lista a
--num_veces(a,b): devuelve la cantidad de veces que aparece el valor a en la lista b
--palabras_mayores_n(n,a): devuelve una lista con las palabras mayores que n

{--------------------------------------------}

-- 1 cambia_el_primero(a,b): cambia el primer valor de la lista b por el valor de a
--function declaration
cambia_el_primero :: Int -> [Int] -> [Int]
--function definition 
cambia_el_primero a list = a:(tail list)		

-- Hugs> :reload
-- Main> cambia_el_primero 1 [2,3,4]
-- [1,3,4]			

{--------------------------------------------}

-- 2 cambia_el_n(a,n,b): cambia el valor de la posicion n de la lista a por el valor de a
--function declaration 
cambia_el_n :: Int -> Int -> [Int] -> [Int]
--function definition 
cambia_el_n a n list = (take (n-1) list)  ++ [a] ++ (reverse(take ((length list)-(n))(reverse(list))))

--cambia_el_n 0 3 [1..10] 
--[1,2,0,4,5,6,7,8,9,10]

{--------------------------------------------}

-- 3 get_mayor_abs(a): devuelve el mayor numero en valor absoluto de la lista a

--function declaration 
get_mayor_abs :: [Int] -> Int
--function definition 		
get_mayor_abs list = maximum ([abs(maximum list)] ++ [abs(minimum list)])

--Main> get_mayor_abs [1,4,100,124,12,6,0]
--124

{--------------------------------------------}

-- 4 num_veces(a,b): devuelve la cantidad de veces que aparece el valor a en la lista b

--function declaration 
num_veces:: Int -> [Int] -> Int			
--function definition 
num_veces a list = length(filter (==a) list)					

{--------------------------------------------}

-- 5 palabras_mayores_n(n,a): devuelve una lista con las palabras mayores que n
--function declaration 
palabras_mayores_n :: Int -> [String] -> [String]
--function definition 			
palabras_mayores_n n list = filter (\x -> length x > n) list			
