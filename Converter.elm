module Converter exposing (toArabic, toRoman)

import String exposing (toUpper, all, toList, fromList)
import Char exposing (isDigit)


toArabic : String -> Result String String
toArabic num =
  let
    upCase =
      toUpper num
  in
    if all isValidRomanNumeral upCase then
      Ok <| toString <| parseRomanNumeral upCase
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


parseRomanNumeral : String -> Int
parseRomanNumeral roman =
  let
    romanList =
      toList roman
  in
    case romanList of
      'I'::'V'::rest -> 4 + (parseRomanNumeral <| fromList rest)
      'I'::'X'::rest -> 9 + (parseRomanNumeral <| fromList rest)
      'X'::'L'::rest -> 40 + (parseRomanNumeral <| fromList rest)
      'X'::'C'::rest -> 90 + (parseRomanNumeral <| fromList rest)
      'C'::'D'::rest -> 400 + (parseRomanNumeral <| fromList rest)
      'C'::'M'::rest -> 900 + (parseRomanNumeral <| fromList rest)
      'I'::rest -> 1 + (parseRomanNumeral <| fromList rest)
      'V'::rest -> 5 + (parseRomanNumeral <| fromList rest)
      'X'::rest -> 10 + (parseRomanNumeral <| fromList rest)
      'L'::rest -> 50 + (parseRomanNumeral <| fromList rest)
      'C'::rest -> 100 + (parseRomanNumeral <| fromList rest)
      'D'::rest -> 500 + (parseRomanNumeral <| fromList rest)
      'M'::rest -> 1000 + (parseRomanNumeral <| fromList rest)
      _ -> 0
