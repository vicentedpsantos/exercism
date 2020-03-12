module Acronym(abbreviate) where

import Data.Char (toUpper, isAlpha, isLower, isUpper)

keepChar :: (Char, String) -> Char -> (Char, String)
keepChar (l, xs) c
  | l =='\'' && c == 's'         = (c, xs)
  | not (isAlpha l) && isAlpha c = (c, xs ++ [toUpper c])
  | isLower l && isUpper c       = (c, xs ++ [c])
  | otherwise                    = (c, xs)

abbreviate :: String -> String
abbreviate = snd . foldl keepChar(' ', [])
