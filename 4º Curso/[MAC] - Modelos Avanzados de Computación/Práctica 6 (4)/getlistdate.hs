-- ===========================================================================
--							Practica 4 - Actividad 2
-- ===========================================================================

-- Dada una lista de Personas con los datos [nombre, apellido y fecha de nacimiento] ordenada ascendentemente 
-- por fecha de nacimiento (deberá crear el tipo fecha), devuelve el segmento más largo de la lista con 
-- las personas que nacieron antes, después o en esa fecha.


-- 															Tipos de Datos
-- Atributos de la persona
type Name = String
type Surname = String
data Date = Date {day::Integer, 
					month::Integer, 
					year::Integer} 
			deriving(Eq,Show)
-- Dato Persona formado por los atributos previamente definidos
data Person = Person {name::Name, 
						surname::Surname, 
						birth_date::Date}
				deriving(Show) --Eq required

-- 														Ejemplos de Personas
-- declarado como persona = atributo 1, atributo 2
person1 = Person {name="Maria",surname="Garcia Correa",birth_date=(Date 18 10 2001)}
person2 = Person {name="Alba",surname="Marquez Rodriguez",birth_date=(Date 7 5 2001)}
person3 = Person {name="Jose",surname="Hernandez Gomez",birth_date=(Date 30 4 1997)}
person4 = Person {name="Fran", surname="Perea Rodriguez",birth_date=(Date 30 4 1984)}
person5 = Person {name="Antonio", surname="Gonzalez Rodriguez",birth_date=(Date 23 11 1963)}

-- Creación de lista de personas
peopleList = [person1,person2,person3,person4,person5]

-- Funciones Auxiliares
earlierDate :: Date -> Date -> Bool
earlierDate date1 date2 = ((year(date1)*10000) + (month(date1)*100) + day(date1)) < ((year(date2)*10000) + (month(date2)*100) + day(date2))

laterDate :: Date -> Date -> Bool
laterDate date1 date2 = ((year(date1)*10000) + (month(date1)*100) + day(date1)) > ((year(date2)*10000) + (month(date2)*100) + day(date2))

test :: Date -> [Person]
test date = [x| x<-peopleList, earlierDate (birth_date x) date]

-- Llama a las funciones necesarias

-- devuelve lista de personas nacidas antes, despues o con la misma date que la introducida
getListDate :: Date -> String -> [Person]
getListDate date what  = case what of
				"antes"   -> [x| x<-peopleList, earlierDate (birth_date x) date]
				"despues" -> [x| x<-peopleList, laterDate (birth_date x) date]
				"misma"   -> [x| x<-peopleList, (birth_date x) == date]
				otherwise -> error "Error, introduzca: antes, despues o misma"