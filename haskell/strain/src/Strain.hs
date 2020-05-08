module Strain 
  (keep
  , discard
  ) where

discard :: (a -> Bool) -> [a] -> [a]
discard predicate enumerator = filter (not . predicate) enumerator 

keep :: (a -> Bool) -> [a] -> [a]
keep predicate enumerator = filter predicate enumerator
