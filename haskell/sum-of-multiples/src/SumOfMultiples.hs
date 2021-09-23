module SumOfMultiples (sumOfMultiples) where

import Data.Set (fromList)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ fromList $ concatMap factor factors
  where
    factor 0 = []
    factor n = [n, n * 2 .. limit - 1]
