main = do
	busca_numero 0
	putStrLn $ "FIN DEL JUEGO"
	


busca_numero :: Int -> IO()
busca_numero a = do 
			putStrLn $ "Es el " ++ (show (succ a)) ++ "?"
			respuesta <- getLine
			if (respuesta == "SI") then
				return ()
			else if (respuesta == "NO") then
				busca_numero (succ a)
			else
				do
					print $ "Error"
					busca_numero (a)