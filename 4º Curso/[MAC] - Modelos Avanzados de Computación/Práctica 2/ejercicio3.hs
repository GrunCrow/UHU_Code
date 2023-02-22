{--------------------------------------------}

-- Sucesión de Fibonacci.

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- Guardas

fib_guardas :: Integer -> Integer
fib_guardas n
	| n == 0 = 0
	| n == 1 = 1
	| n > 1 = fib_guardas (n-1) + fib_guardas (n-2)
	| otherwise = error "valor negativo"
	
	
-- if then else

fib_if :: Integer -> Integer
fib_if n =
	if (n == 0) then 0
	else if (n == 1) then 1
	else if (n < 0) then error "n debe positivo"
	else fib_if (n-1) + fib_if (n-2)
	
	