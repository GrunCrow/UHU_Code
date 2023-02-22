-- ===========================================================================
--								Sesión 8 - Practica 5
-- ===========================================================================

-- Realizar un ejemplo de definicion de tipos (como por ejemplo los datos
-- de un prestamo de materiales: id, nombre, fk_usuario, fecha_salida,
-- fecha_entrada, observaciones). 

-- Crear las instancias de al menos 3 prestamos y mostrar por pantalla
-- uno de ellos.

data Id = Id Int deriving(Show)
data Nombre = Nombre String deriving(Show)
data Fk_usuario = Fk_usuario Int deriving(Show)
data Fecha = Fecha Int Int Int deriving(Show)
data Fecha_salida = Fecha_salida Fecha deriving(Show)
data Fecha_entrada = Fecha_entrada Fecha deriving(Show)
data Observaciones = Observaciones String deriving(Show)

data Prestamo_de_materiales = Prestamo_de_materiales Id Nombre Fk_usuario Fecha_salida Fecha_entrada Observaciones deriving(Show)

Prestamo_de_materiales 0 "Alba" "GrunCrow"