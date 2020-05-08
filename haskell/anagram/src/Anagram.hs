module Anagram (anagramsFor) where
import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor targetString candidates = filter (isAnagramOf targetString) candidates

isAnagramOf :: String -> String -> Bool
isAnagramOf word1 word2 = (sort word1l) == (sort word2l) && word1l /= word2l
  where
    word1l = map toLower word1
    word2l = map toLower word2
