-- ===========================================================================
--							Practica 4 - Actividad 3
-- ===========================================================================

-- Crear un Node binario con 5 Leafs y realizar mostrar los elementos del árbol por pantalla, 
-- recorriendo el árbol en profundidad o en anchura. Debe ser especificado el método utilizado.

--										 Declaración del dato arbol Binario
data BinaryTree = Empty | 
					Leaf {value::Int} | 
					Node {value::Int, 
							left::BinaryTree, 
							right::BinaryTree} 
				deriving(Eq,Show)


--											 Declaración del ejemplo de arbol 
tree = Node{value=0, 
			left=(Node{value=1,
				left=(Leaf{value=3}),
				right=(Leaf{value=4})}),
		    right=(Node{value=2, 
				left=(Leaf{value=5}), 
				right=Empty})}

--											Funciones Auxiliares
-- nivel y altura

-- Funcion leveltree 
leveltree :: BinaryTree -> Int -> [Int]
leveltree Empty _ = []
leveltree (Node value left right) 0 = [value]
leveltree (Leaf x) level = [x]
leveltree (Node value left right) level = (leveltree left (level-1))++(leveltree right (level-1))

-- Funcion getheight 
getheight :: BinaryTree -> Int
getheight (Leaf _) = 1
getheight (Node _ left Empty) = 1 + (getheight left)
getheight (Node _ Empty right) = 1 + (getheight right)
getheight (Node _ left right) = 1 + (max (getheight left) (getheight right))

--												Funciones de Recorridos

--	Profundidad: preorden, inorden, postorden

-- preorden (current, left, right)
preorder :: BinaryTree -> [Int]
preorder Empty = []
preorder (Leaf x) = [x]
preorder (Node value left right) =  [value] ++ (preorder left) ++ (preorder right)

-- inorden (left, current, right)
inorder :: BinaryTree -> [Int]
inorder Empty = []
inorder (Leaf x) = [x]
inorder (Node value left right) =  (inorder left) ++ [value] ++ (inorder right)

-- postorden (left, right, current)
postorder :: BinaryTree -> [Int]
postorder Empty = []
postorder (Leaf x) = [x]
postorder (Node value left right) =  (postorder left) ++ (postorder right) ++ [value]


-- Anchura (left to right)
width :: BinaryTree -> [Int]
width tree = widthRec tree ((getheight tree)-1)
	
widthRec :: BinaryTree -> Int -> [Int]
widthRec tree 0 = leveltree tree 0
widthRec tree level = (widthRec tree (level-1))++(leveltree tree level)

--												 Funcion Principal
recorrearbol :: String -> [Int]
recorrearbol what = case what of
				"preorden" -> preorder tree
				"inorden" -> inorder tree
				"postorden" -> postorder tree
				"anchura" -> width tree
				otherwise -> error "Error"
