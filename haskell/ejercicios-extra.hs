-- implementacion del mergeSort

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] [] = []
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys) 
    | x <= y = x:merge xs (y:ys)
    | otherwise = y:merge ys (x:xs)

mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = 
    let (left, right) = splitAt (length xs `div` 2) xs
    in merge (mergeSort left) (mergeSort right)

-- ejercicio 2) de la guia de D&C de TDA, dado un arreglo de tamaño potencia de dos
-- decimos que es izquierda dominante si:
-- * la suma de sus elementos de la mitad izquierda supera los de la derecha
-- * cada una de las mitades izquierdas es a su vez izquierda dominante
-- TO-DO

-- ejercicio 3) D&C
-- Dado un arreglo de n enteros distintos (positivos y negativos) en orden estrictamente creciente. Queremos determinar si existe una posicion i tal que a_i = i.
-- ejemplo, a = [-4, -1, 2, 4, 7], i = 4
indiceEspejo :: [Int] -> Bool
indiceEspejo [] = False
indiceEspejo [1] = True
indiceEspejo [_] = False
indiceEspejo xs 
    | l+1 == head der = True
    | l+1 > last izq = indiceEspejo der
    | otherwise = indiceEspejo izq
    where 
        l = length xs  
        (izq, der) = splitAt (l `div` 2) xs
