-- Implementar la fauncion filter2

-- Main> filter2 (==1) [1,2,3]
-- [1] :: [Integer]

filter2 :: (a->Bool)->[a]->[a]
filter2 f list = [ x | x <- list, f x]


-- Implementar SumaCuadradosPares xs: suma de los cuadrados de los numeros pares
-- de la lista xs

-- sumaCuadradoPares [1..5] = 20

-- sumaCuadradoPares :: (a->Bool)->[a]->[a]
sumaCuadradoPares list = sum[x^2 | x <- list, even x]
--[x | x <- list, if x % 2 == 0 then sum(x)]--sum(paresList)