module Converter exposing (toArabic, toRoman)

import String exposing (toUpper, all, toList, fromList, toInt, repeat)
import Char exposing (isDigit)


toArabic : String -> Result String String
toArabic roman =
  let
    upCase =
      toUpper roman
  in
    if all isValidRomanNumeral upCase then
      Ok <| toString <| parseRomanNumeral upCase
    else
      Err "Invalid input"


toRoman : String -> Result String String
toRoman arabic =
  if all isDigit arabic then
    let
      num =
        Result.withDefault 0 <| toInt arabic
    in
      Ok <| parseArabicNumber num

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


parseArabicNumber : Int -> String
parseArabicNumber arabic =
  let
    thousands =
      arabic // 1000

    rem100 =
      arabic % 1000

    hundreds =
      rem100 // 100

    rem10 =
      rem100 % 100

    tens =
      rem10 // 10

    ones =
      rem10 % 10
  in
    (formatNumberParts thousands "M" "" "")
    ++ (formatNumberParts hundreds "C" "D" "M")
    ++ (formatNumberParts tens "X" "L" "C")
    ++ (formatNumberParts ones "I" "V" "X")


formatNumberParts : Int -> String -> String -> String -> String
formatNumberParts count onePart fivePart upperOnePart =
  if count == 9 then
    onePart ++ upperOnePart
  else if count >= 5 then
    fivePart ++ (formatNumberParts (count % 5) onePart fivePart upperOnePart)
  else if count == 4 then
    onePart ++ fivePart
  else if count > 0 then
    repeat count onePart
  else
    ""
