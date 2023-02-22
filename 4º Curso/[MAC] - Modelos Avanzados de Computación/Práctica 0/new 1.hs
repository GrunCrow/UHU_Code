-- New
-- show: clase que describe tipo de datos cuyos valores se pueden mostrar como cadena
-- read: clase que describe tipo de datos cuyos valores se pueden parsear desde una cadena de caracteres
-- bounded: clase que describe tipos de datos acotados. Contiene los métodos maxBound y minBound que devuelven los valores maximos y minimos del tipo
-- real: numeros reales
-- integral: subclase de Num y Reak que describe datos enteros (sin decimales). Contiene los metodos quot (division entera truncada hacia el 0), rem (resto de la division entera truncada hacia el 0), div y mod
-- fractional: subclase de num
-- floating: subclase de fractional
-- RealFloat: subclase que añade metodos
-- Monad: tipo especial de datos para entradas y salidas

sumadouble :: Double -> Double -> Double -> Double
sumadouble z x y = 1 + x + y