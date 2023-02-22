{- ----------------------------------------- -}
-- info iguales muestra						--
iguales::Eq a=>a->a->a->Bool

iguales x y z = x ==y && y==z
{- ----------------------------------------- -}