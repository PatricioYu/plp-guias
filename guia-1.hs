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
-- 3) Redifinir usando foldr las funciones sum, elem, (++), filter y map
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
filterFoldr p = foldr (\x rec -> if p x == True then x:rec else rec) []

mapFoldr :: (a -> b) -> [a] -> [b]
mapFoldr f = foldr (\x rec -> (f x):rec) []