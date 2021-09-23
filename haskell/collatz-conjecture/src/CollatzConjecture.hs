module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz x
  | x <= 0     = Nothing
  | otherwise  = Just (step x 0)
  where
    step :: Integer -> Integer -> Integer
    step n acc
      | n == 1    = acc
      | even n    = step (div n 2) (acc + 1)
      | otherwise = step (3 * n + 1) (acc + 1)
