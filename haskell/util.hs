alinearDerecha :: Int -> String -> String
alinearDerecha n s = if n > length s then (take (n - length s) [' ' | _ <- [0..]]) ++ s else s

-- >>> alinearDerecha 6 "hola"
-- "  hola"

actualizarElem :: Int -> (a -> a) -> [a] -> [a]
actualizarElem n f xs = actualizarElem' f xs n
    where
        actualizarElem' :: (a -> a) -> [a] -> (Int -> [a])
        actualizarElem' f = foldr (\x rec n -> if n == 0 then f x :rec (n-1) else x:rec (n-1)) (const [])

-- >>> actualizarElem 1 (+10) [0,1,2,3,4]
-- [0,1,2,3,4]

-- >>> actualizarElem -1 (+10) [0,1,2,3,4]
-- Could not deduce `Num a0_a1mV0[tau:1]'
-- from the context: (Num a2_a1mUS[sk:1], Num a3_a1mUT[sk:1],
--                    Num
--                      ((a2_a1mUS[sk:1] -> a2_a1mUS[sk:1])
--                       -> [a3_a1mUT[sk:1]]
--                       -> Int
--                       -> (a4_a1mUU[sk:1] -> a4_a1mUU[sk:1])
--                       -> [a4_a1mUU[sk:1]]
--                       -> [a4_a1mUU[sk:1]]),
--                    Num
--                      (Int
--                       -> (a4_a1mUU[sk:1] -> a4_a1mUU[sk:1])
--                       -> [a4_a1mUU[sk:1]]
--                       -> [a4_a1mUU[sk:1]]))
--   bound by the inferred type for `it_a1mRJ':
--              forall {a2} {a3} {a4}.
--              (Num a2, Num a3,
--               Num ((a2 -> a2) -> [a3] -> Int -> (a4 -> a4) -> [a4] -> [a4]),
--               Num (Int -> (a4 -> a4) -> [a4] -> [a4])) =>
--              Int -> (a4 -> a4) -> [a4] -> [a4]
--   at /home/patricioyu/plp/util.hs:17:2-36
-- The type variable `a0_a1mV0[tau:1]' is ambiguous
-- Potentially matching instances:
--   instance RealFloat a => Num (Complex a)
--     -- Defined in `Data.Complex'
--   instance forall k (a :: k). HasResolution a => Num (Fixed a)
--     -- Defined in `Data.Fixed'
--   ...plus 79 others
--   (use -fprint-potential-instances to see them all)
-- In the ambiguity check for the inferred type for `it_a1mRJ'
-- To defer the ambiguity check to use sites, enable AllowAmbiguousTypes
-- When checking the inferred type
--   it_a1mRJ :: forall {a1} {a2} {a3}.
--               (Num a1, Num a2,
--                Num ((a1 -> a1) -> [a2] -> Int -> (a3 -> a3) -> [a3] -> [a3]),
--                Num (Int -> (a3 -> a3) -> [a3] -> [a3])) =>
--               Int -> (a3 -> a3) -> [a3] -> [a3]
