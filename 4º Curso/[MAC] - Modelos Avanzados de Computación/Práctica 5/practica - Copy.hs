-- ===========================================================================
--								Sesión 8 - Practica 5
-- ===========================================================================

-- Definir una lista de personas (al menos 5) con los siguientes campos:
-- (Nombre, apellidos, edad)
-- La lista debe definirse de foram ordenada por edad, de menor a mayor.

-- Una vez hecho realizar las siguientes funciones:

data Persona = Persona { nombre :: String, apellidos :: String, edad :: Int } deriving(Show,Eq) -- Eq para que sea equiparable

usuario1 = Persona { nombre = "n1" , apellidos = "a1" , edad = 39 }
usuario2 = Persona { nombre = "n2" , apellidos = "a2" , edad = 40 }
usuario3 = Persona { nombre = "n3" , apellidos = "a3" , edad = 41 }
usuario4 = Persona { nombre = "n4" , apellidos = "a4" , edad = 42 }
usuario5 = Persona { nombre = "n5" , apellidos = "a5" , edad = 43 }

takePersonas :: [Persona] -> Int -> [Persona]
takePersonas [] f = []
takePersonas (p:ps) f 	| esMenor p f = p : (takePersonas ps f) -- si es menor me queedo con el primero y hago recursividad sobre el siguiente y solo me quedo con  las personas cuya edad sea menor
						| otherwise = []
						
esMenor :: Persona -> Int -> Bool
esMenor (Persona n a e) e1 = e < e1


existe :: [Persona] -> String -> [Persona]
existe [] p1 = []
existe (p:ps) p1	= do
						{
							if esta p p1 then [p]
							else existe ps p1
						}
						
esta :: Persona -> String -> Bool
esta (Persona n a e) e1 = n == e1
