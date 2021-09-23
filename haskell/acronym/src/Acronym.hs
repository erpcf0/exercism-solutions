module Acronym (abbreviate) where

import           Data.Text (Text)
import qualified Data.Text as T

abbreviate :: Text -> Text
abbreviate = T.pack . map ((`T.index` 0) . T.toUpper) . T.split (== ' ')
