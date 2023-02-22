-- ===========================================================================
--							Practica 4 - Actividad 1
-- ===========================================================================

-- Dada una lista de Pizzas [lista de ingredientes y un precio],
-- devuelve el segmento más largo de la lista que comienza con la pizza que
-- tiene el menor precio superior a X euros.


-- 															Tipos de Datos
-- Atributos de la Pizza
type Ingredients = [String]
type Price = Int
-- Dato Pizza formado por los atributos previamente definidos
data Pizza = Pizza {ingredients :: Ingredients, price :: Price} deriving(Show, Eq) --Eq required

-- 														Ejemplos de Pizzas
-- declarado como pizza = atributo 1, atributo 2
margarita = Pizza {ingredients = ["Tomatoe Sauce","Mozzarella","Ham"], price=8}
formaggio = Pizza {ingredients = ["Tomatoe Sauce","Mozzarella","Blue Cheese","Gouda"], price=14}
barbacue = Pizza {ingredients = ["Tomatoe Sauce","Mozzarella","Bacon","Chicken","Barbacue Sauce"], price=12}
carbonara = Pizza {ingredients = ["Cream","Mozzarella","Onion","Mushroom"], price=13}
hawaian = Pizza {ingredients = ["Tomatoe Sauce","Mozzarella","Ham","Pineapple"], price=12}

-- Creación de lista de Pizzas
pizzaList = [margarita,formaggio,barbacue,carbonara,hawaian]

-- devuelve el segmento más largo de la lista que comienza con la pizza que tiene el menor precio superior a X euros
-- 1. Filtrar por precios superiores a X€
higherPriceThan :: Price -> [Pizza] -> [Pizza]
higherPriceThan _ [] = [] -- base case
higherPriceThan x (head_element:rest_list) =
	if (price(head_element) > x) then
		[head_element]++(higherPriceThan x rest_list)
	else
		(higherPriceThan x rest_list)

testhigher :: Price -> [Pizza]
testhigher x = higherPriceThan x pizzaList
	
-- 2. Filtrar con Pizza con menor precio
lowerPriceItem :: [Pizza] -> Pizza
lowerPriceItem (head_element:[]) = head_element -- base case
lowerPriceItem (head_element:(head_element2:rest_list)) =
	if price(head_element) <= price(head_element2) then
		lowerPriceItem ([head_element]++rest_list)
	else if price(head_element2) < price(head_element) then
		lowerPriceItem ([head_element2]++rest_list)
	else
		head_element

testlower = lowerPriceItem pizzaList

-- Llama a las funciones necesarias
dropPrice :: Price -> [Pizza]
dropPrice x = dropPriceRec x pizzaList

dropPriceRec :: Price -> [Pizza] -> [Pizza]
dropPriceRec _ [] = []
dropPriceRec x (head_element:rest_list) =
	if head_element == lowerPriceItem(higherPriceThan x ([head_element]++rest_list)) then
		[head_element]++rest_list
	else
		dropPriceRec x rest_list