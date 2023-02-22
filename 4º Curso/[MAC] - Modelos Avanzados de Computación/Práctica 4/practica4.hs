import AuxiliarFunctions

main = do
	busca_numero 0 100
	putStrLn $ "FIN DEL JUEGO"
	

busca_numero :: Int -> Int -> IO()
busca_numero start end = do 
			putStrLn $ "¿Es el numero el " ++ (show (start)) ++ "?"
			respuesta <- getLine
			if (respuesta == "encontrado") then
				return ()
			else if (respuesta == "mayor") then
				if (start >= 100) then do
					print $ "Error, el numero no puede ser mayor de 100"
					busca_numero start end
				else
					busca_numero (next start end) end
			else if (respuesta == "menor") then
				if (start <= 0) then do
					print $ "Error, el numero no puede ser menor de 0"
					busca_numero start end
				else
					busca_numero (start - (end - (next start end))) start
			else
				do
					print $ "Error, introduzca 'mayor', 'menor' o 'encontrado'"
					busca_numero start end