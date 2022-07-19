module Leap where

import Prelude
import Data.Int (rem)

isLeapYear :: Int -> Boolean
isLeapYear year =
  (rem year 4 == 0) && (rem year 100 /= 0 || rem year 400 == 0)
