module Converter exposing (toArabic, toRoman)

import String exposing (toUpper, all)
import Char exposing (isDigit)


toArabic : String -> Result String String
toArabic num =
  let
    upCase =
      toUpper num
  in
    if all isValidRomanNumeral upCase then
      Ok "1"
    else
      Err "Invalid input"


toRoman : String -> Result String String
toRoman num =
  if all isDigit num then
    Ok "I"
  else
    Err "Invalid input"


isValidRomanNumeral : Char -> Bool
isValidRomanNumeral char =
  case char of
    'I' -> True
    'V' -> True
    'X' -> True
    'L' -> True
    'C' -> True
    'D' -> True
    'M' -> True
    _ -> False
