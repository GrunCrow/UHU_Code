-- ===========================================================================
--									 Practica 5
-- ===========================================================================

-- 								Ejemplo: crear tipo RGB

-- red = 255 0 0
-- green = 0 255 0
-- blue = 0 0 255

data RGBColor = RGBColor Int Int Int deriving (Show)

red		= RGBColor 255 0 0
green	= RGBColor 0 255 0
blue	= RGBColor 0 0 255

mix :: RGBColor -> RGBColor -> RGBColor

-- data RGB = color Int Int Int | red 255 0 0 | green 0 255 0 | blue 0 0 255

--mix :: color -> color -> color 

