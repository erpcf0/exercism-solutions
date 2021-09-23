module Grains (square, total) where

import Data.Maybe

square :: Integer -> Maybe Integer
square n
  | n > 0 && n <= 64 = Just (2 ^ (n - 1))
  | otherwise = Nothing

total :: Integer
total = sum $ mapMaybe square [0..64]
-- total = foldr ((+). fromJust . square) 0 [1..64]

