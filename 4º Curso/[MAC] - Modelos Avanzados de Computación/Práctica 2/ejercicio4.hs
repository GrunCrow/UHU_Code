{--------------------------------------------}

-- Comprobar la pertenencia a una lista usando una función recursive
pertenece n list = list [] = False
pertenece n list (head list) == n = True -- si el primer elemento de la lista es n, true, else recursividad quitando la head
pertenece n list = pertenece (tail list)

-- Guardas
pertenece_guardas n list
	| list == [] = False
	| (head list) == n = True -- si el primer elemento de la lista es n, true, else recursividad quitando la head
	| otherwise = pertenece_guardas n (tail list)
	
-- if then else
pertenece_if n list = 
	if list == [] then False
	else if (head list) == n then True -- si el primer elemento de la lista es n, true, else recursividad quitando la head
	else pertenece_if n (tail list)