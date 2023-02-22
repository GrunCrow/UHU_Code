-- Practica 3

ejercicio1 list = [ x+10 | x <- list]

ejercicio2 list = [[x] | x <- list, even x]

ejercicio3 list = [ 11-x | x <- list]

ejercicio4 list = [ odd x | x <- list]

ejercicio5 list = [ (3*x,odd x) | x <- list, x <= 6]

ejercicio6 list = [ (5*x,odd x) | x <- list, x <= 3 || x == 8]

ejercicio7 list = [ (x+10,x+11) | x <- list, odd x]

ejercicio8 list = [ [5..x+6] | x <- list, x<=7 && odd x]

ejercicio9 list = [ 5*(11-x)-4 | x <- list, x>5]

ejercicio10 list = [[(x+2),(x)..(4)] | x <- list, even x]