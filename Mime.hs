module Mime
( combineParts
) where

combineParts :: String -> String -> String
combineParts textContent htmlContent =
    textContent ++ htmlContent

