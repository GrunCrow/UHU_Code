-- Ejercicio 1

-- definir la funcion busca numero para encontrar el numero buscado.
-- El programa preguntara si el valor 1 es el correcto y se respondera SI o NO.
-- En caso de ser el numero, el programa termina, en caso contrario se sumará 1 y se sigue.
-- Nota: para mostrar por pantalla el valor 

juego :: IO()
juego =
	do 	putStrLn "Numero entre el 1 y el 100"
		busca_numero 1 100
		putStrLn $ "Fin del juego"
		

busca_numero :: Int -> Int -> IO()
busca_numero min max =
			do putStr ("Es " ++ show proximo ++ " el numero [SI/NO] ")
				ans <- getLine
				case s of
					"NO"->busca_numero min+1 max
					"SI"->return ()
						->putStr ("Error en la entrada, responda SI o NO: Es " ++ show proximo ++ " el numero? [SI/NO]")
							busca_numero min max
			where
				proximo = a



--ans <- getLine
--if (ans == "SI") then True
--else False
--putStrLn $ "A"