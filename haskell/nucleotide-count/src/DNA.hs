{-# LANGUAGE LambdaCase #-}
module DNA (nucleotideCounts, Nucleotide(..)) where

import           Control.Monad
import           Data.Map      (Map)
import qualified Data.Map      as M

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldM nucleotide nuMap
  where
    nuMap :: Map Nucleotide Int
    nuMap = M.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

nucleotide :: Map Nucleotide Int -> Char -> Either String (Map Nucleotide Int)
nucleotide m c = update <$> cast c
  where
    update n = M.adjust (+ 1) n m
    cast = \case
      'A' -> Right A
      'C' -> Right C
      'G' -> Right G
      'T' -> Right T
      _ -> Left "Invalid strand."
