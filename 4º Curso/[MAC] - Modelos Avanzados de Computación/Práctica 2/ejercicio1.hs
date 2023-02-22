{--------------------------------------------}

-- Sea la función nsobrek tal que nsobrek n k es el número de combinaciones
-- de n elementos tomados de k en k; es decir
-- factorial_guarda :: (Num a, Ord a) => a -> a

-- Guardas

factorial_guardas n
	| n == 0 = 1
	| n > 0 = n * factorial_guardas(n-1)
	| otherwise = error "valor negativo"
	

nsobrek_guardas n k
	| n > k = (factorial_guardas n) / ((factorial_guardas k) * factorial_guardas (n-k))
	| otherwise = error "n debe ser mayor que k"

-- if then else

factorial_if n = if (n == 0) then 1 else n*factorial_if(n-1)
	
nsobrek_if n k =
	if (n > k) then (factorial_if n) / ((factorial_if k) * factorial_if (n-k))
	else error "n debe ser mayor que k"


-- case

factorial_case n = case (n == 0) of
					True-> 1 
					False->n*factorial_case(n-1)

nsobrek_case n k = case (n > k) of
					True->(factorial_case n) / ((factorial_case k) * factorial_case (n-k))
					False -> error "n debe ser mayor que k"


