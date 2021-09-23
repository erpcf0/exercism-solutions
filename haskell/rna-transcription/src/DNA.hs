module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = mapM transcription
  where
    transcription :: Char -> Either Char Char
    transcription str = case str of
      'G' -> Right 'C'
      'C' -> Right 'G'
      'T' -> Right 'A'
      'A' -> Right 'U'
      _ -> Left str
