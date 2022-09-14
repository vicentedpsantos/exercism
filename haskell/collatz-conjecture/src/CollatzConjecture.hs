module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
    | n <= 0 = Nothing
    | n == 1 = Just 0
    | even n = succ <$> collatz (n `div` 2)
    | odd n  = succ <$> collatz (3 * n + 1)

-- <$> is an infix for `fmap`
-- succ could be substituted by (+1) and fmap for easier readability
-- fmap (+1) $ collatz (...)

-- initial approach without using `fmap`

collatz' :: Integer -> Maybe Integer
collatz' n
    | n <= 0 = Nothing
    | otherwise = let chain = collatzChain n
                  in Just (fromIntegral $ (length chain) - 1)

collatzChain :: (Integral a) => a -> [a]
collatzChain 1 = [1]
collatzChain x
    | even x = x:collatzChain (x `div` 2)
    | otherwise = x:collatzChain (x * 3 + 1)
