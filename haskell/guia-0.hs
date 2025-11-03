-- 2)a)
valorAbsoluto :: (Num a, Ord a) => a -> a
valorAbsoluto x | x < 0 = -x
                | otherwise = x

-- 2)b)
bisiesto :: Int -> Bool
bisiesto x | x < 0 = error "no existen los años negativos."
bisiesto x = ((x `mod` 4 == 0) && (x `mod` 100 /= 0)) || (x `mod` 400 == 0)

-- 2)c)
factorial :: Int -> Int
factorial 0 = 1
factorial x = factorial (x-1) * x

-- 2)d)
esPrimo :: Int -> Bool
esPrimo x = (valorAbsoluto x > 1) && null [d | d <- [2..x-1], x `mod` d == 0]

-- contarOcurrencias :: (Eq a) => a -> [a] -> Int
-- contarOcurrencias x xs = length (filter (==x) xs)

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos x | valorAbsoluto x <= 1 = 0
cantDivisoresPrimos x = length [d | d <- [2..valorAbsoluto x], x `mod` d == 0 && esPrimo d]

-- 3)a)
inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso x = Just (1/x)

-- 3)b)
aEntero :: Either Int Bool -> Int
aEntero x = case x of
    Left n | (n /= 0) && (n /= 1) -> error "no es un booleano"
           | otherwise -> n
    Right b | b -> 1
            | otherwise -> 0

-- 4)a)
limpiar :: String -> String -> String
-- queremos que los caracteres de "b" no esten en "a", usamos notElem como predicado del filter
limpiar a = filter (`notElem` a)

-- 4)b)
-- primera version
-- difPromedio :: [Float] -> [Float]
-- difPromedio xs = map (\x -> x - (sum xs/fromIntegral (length xs))) xs

-- version mejorada por chatgpt, evita calcular el promedio en cada iteracion del map
difPromedio :: [Float] -> [Float]
difPromedio xs = map (\x -> x - promedio) xs
       where promedio = sum xs / fromIntegral (length xs)

-- 4)c)
todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales (x:xs) = all (==x) xs

-- 5)
-- definimos un tipo de dato para arboles binarios
data AB a = Nil | Bin (AB a) a (AB a) deriving (Eq, Show, Read)

-- 5)a)
-- indica si un arbol es vacio
vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

-- 5)b)
negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin izq v der) = Bin (negacionAB izq) (not v) (negacionAB der)

-- 5)c)
productoAB :: AB Int -> Int
-- el productoAB de Nil retorna 1, como el comportamiento de la funcion product [] que tambien retorna 1
productoAB Nil = 1
productoAB (Bin izq v der) = productoAB izq * v * productoAB der

-------- para probar las funciones --------
-- 4)b)
listaFloats1 :: [Float] = [2,3,4]
listaFloats2 :: [Float] = [7]

-- 4)c)
listaInt1 :: [Int] = [1,1,2,3,5]
listaEntIguales :: [Int] = [1,1,1]

-- 5)
arbolBool1 :: AB Bool = Bin (Bin Nil True Nil) False (Bin Nil False Nil)
arbolInt1 :: AB Int = Bin (Bin Nil 1 Nil) 2 (Bin Nil 3 Nil)
arbolInt2 :: AB Int = Bin (Bin Nil 10 Nil) 3 Nil