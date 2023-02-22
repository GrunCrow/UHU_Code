import AuxiliarFunctions

-- comenzar programa llamando a busca_numero con los parametros inicializados como 0 y 100
main = do
	busca_numero 0 100
	-- una vez termina el juego lo notifica con un print
	putStrLn $ "FIN DEL JUEGO"

busca_numero :: Int -> Int -> IO()
busca_numero start end = do 
			-- Pregunta si el numero es el que estamos buscando
			putStrLn $ "Es el numero el " ++ (show (next start end)) ++ "?"
			-- Coge el input del usuario
			respuesta <- getLine
			-- Analiza el input
			
			-- Si el numero ha sido encontrado, el programa termina
			if (respuesta == "encontrado") then
				return ()
			-- si es mayor:
			else if (respuesta == "mayor") then
				-- primero verifica  que el siguiente numero no vaya a salirse los limites (no sea mayor de 100), sino error y repetir con los mismos parametros
				if (next start end >= 100) then do
					error_code 1
					busca_numero start end
				-- si el siguiente numero no se sale de los limites buscará el numero en la mitad superior, para eso usa la funcion next para calcular el siguiente
				else
					busca_numero (next start end) end
			-- primero verifica  que el siguiente numero no vaya a salirse los limites (no sea menor de 0), sino error y repetir con los mismos parametros
			else if (respuesta == "menor") then
				if (next start end <= 0) then do
					error_code (-1)
					busca_numero start end
				-- si el siguiente numero no se sale de los limites buscará el numero en la mitad superior, para eso usa la funcion next para calcular el siguiente
				else
					busca_numero (start) (next start end)
			-- si el input recibido no es ninguno de los contemplados entonces repetirá el programa con los mismos parametros y sacará un print informando del error
			else
				do
					error_code 0
					busca_numero start end