{--------------------------------------------}

-- Definir la función raíces tal que raices a b c es la lista de las raíces
-- de la ecuación ax^2+bx+c = 0

-- Guardas
raices_guardas::(Floating x, Ord x) => x -> x -> x -> [x]
raices_guardas a b c
	| (a == 0) && (b /= 0) = [(-c)/b]
	| (a == 0) && (b == 0) = error "No hay variable X"
	| (b*b - 4*a*c) < 0 = error "La raiz es negativa"
	| otherwise = unico [(-b + sqrt (b*b - 4*a*c) )/(2*a), (-b - sqrt (b*b - 4*a*c) )/(2*a)]
		where
		unico [] = []
		unico list = (head list):unico (filter (\x -> x /= (head list)) list)

-- if
raices_if::(Floating x, Ord x) => x -> x -> x -> [x]
raices_if a b c =
	if (a == 0) && (b /= 0) then [(-c)/b]
	else if (a == 0) && (b == 0) then error "No hay variable X"
	else if (b*b - 4*a*c) < 0 then error "La raiz es negativa"
	else unico [(-b + sqrt (b*b - 4*a*c) )/(2*a), (-b - sqrt (b*b - 4*a*c) )/(2*a)]
		where
		unico [] = []
		unico (h:hs) = h:unico (filter (\x -> x /= h) (hs))