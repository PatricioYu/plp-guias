-------------------- CURRIFICACIÓN Y TIPOS --------------------
-- 1) Considerar las sig def de funciones:

-- (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y
-- (FLoat, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)
-- Float -> Float -> Float
substract = flip (-)
-- Float -> Float
predecesor = substract 1
-- [a -> b -> c] -> [b -> a -> c]
flipAll =  map flip
-- b -> (a -> b -> c) -> a -> c
flipRaro = flip flip

suma :: (Int, Int) -> Int
suma (a, b) = a + b

suma2 :: Int -> Int -> Int
suma2 a b = a + b

-- 2)a)
curryIndio :: ((a, b) -> c) -> a -> b -> c
curryIndio f a b = f (a, b)

-- 2)b)
uncurryIndio :: (a -> b -> c) -> (a, b) -> c
uncurryIndio f (a, b) = f a b

-------------------- ESQUEMAS DE RECURSIÓN --------------------
-- 3)a) Redifinir usando foldr las funciones sum, elem, (++), filter y map
sumaFoldr :: [Int] -> Int
sumaFoldr = foldr (+) 0

elemFoldr :: (Eq a) => a -> [a] -> Bool
elemFoldr x = foldr (\y rec -> rec || y == x) False
-- equivalente
-- elemFoldr x = foldr ((||) . (==x)) False

concatFoldr :: [a] -> [a] -> [a]
concatFoldr = flip (foldr (:))
-- flip foldr (:) [1,2,3] [4,5,6]
-- foldr (:) [4,5,6] [1,2,3]
-- 1 : foldr (:) [4,5,6] [2,3]
-- 1 : (2 : foldr (:) [4,5,6] [3])
-- 1 : (2 : (3 foldr (:) [4,5,6]))
-- 1 : (2 : (3 : [4,5,6]))
-- 1 : (2 : [3,4,5,6])
-- 1 : [2,3,4,5,6]
-- [1,2,3,4,5,6]

filterFoldr :: (a -> Bool) -> [a] -> [a]
filterFoldr p = foldr (\x rec -> if p x then x:rec else rec) []

mapFoldr :: (a -> b) -> [a] -> [b]
-- mapFoldr f = foldr (\x rec -> f x:rec) []
mapFoldr f = foldr ((:) . f) []

-- 3)b) devuelve el maximo elemento de la lista segun una funcion de comparacion utilizando foldr. xej maximum = mejorSegun (>)
mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x rec -> if f x rec then x else rec)

-- 3)c) dada una lista de numeros devuelve otra de la misma longitud, que tiene en cada posicion la suma parcial de los elementos de la lista original desde la cabeza hasta la posicion actual. xej, sumasParciales [1,4,-1,0,5] ~> [1,5,4,4,9]

sumasParciales :: Num a => [a] -> [a]
sumasParciales = foldl (\ac a -> if null ac then [a] else ac ++ [a + last ac]) []

-- 3)d)
sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0
-- foldr [1,2,3,4,5]
-- 1 - (foldr [2,3,4,5])
-- 1 - (2 - foldr [3,4,5])
-- 1 - (2 - (3 - foldr[4,5]))
-- 1 - (2 - (3 - (4 - foldr [5])))
-- 1 - (2 - (3 - (4 - 5))))
-- 1 - (2 - (3 - (-1)))
-- 1 - (2 - 4)
-- 1 - (-2)
-- 3

-- 3)e)
sumaAltReves :: Num a => [a] -> a
sumaAltReves = foldr (-) 0 . reverse
-- sumaAltReves = foldl (\ac x -> x - ac) 0

-- 4)a) dada una lista devuelve todas sus permutaciones
permutaciones :: [a] -> [[a]]
permutaciones = foldr (\x rec -> concatMap (\xs -> map (f x xs) [0..length xs]) rec) [[]]
    where f x xs index = drop index xs ++ [x] ++ take index xs

-- [3,1,2]
-- 3 * 1 * (map f 2 [] [0..0]) --> 3 * 1 * (f 2 [] 0 = drop 0 [] ++ [2] ++ take 0 []) = [2]
-- 3 * (map f 1 [2] [0..1]) --> [drop 0 [2] ++ [1] ++ take 0 [2]] ++ [drop 1 [2] ++ [1] ++ take 1 [2]] = [[1,2]]

-- >>> permutaciones [3,1,2]
-- [[2,1,3],[1,3,2],[3,2,1],[1,2,3],[2,3,1],[3,1,2]]
