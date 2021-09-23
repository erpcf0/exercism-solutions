module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all (`elem` str) alphabet
  where
    alphabet = ['a'..'z']
    str = map toLower text