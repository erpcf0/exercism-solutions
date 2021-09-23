{-# LANGUAGE OverloadedStrings #-}
module Bob (responseFor) where

import           Data.Text (Text)
import qualified Data.Text as T

responseFor :: Text -> Text
responseFor xs
  | input == ""        = "Fine. Be that way!"
  | scream && question = "Calm down, I know what I'm doing!"
  | question           = "Sure."
  | scream             = "Whoa, chill out!"
  | otherwise          = "Whatever."
  where
    input = T.strip xs
    question = T.last input == '?'
    upper = T.toUpper xs
    scream = upper == xs && T.toLower xs /= upper
