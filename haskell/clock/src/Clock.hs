module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m =
  let m' = m `mod` 60
      h' = (h + m `div` 60) `mod` 24
  in Clock h' m'

toString :: Clock -> String
toString (Clock h m) = str h ++ ":" ++ str m
  where str x | x <= 9 = '0' : show x
              | otherwise = show x

addDelta :: Int -> Int -> Clock -> Clock
addDelta hd md (Clock h m) = fromHourMin (h + hd) (m + md)
