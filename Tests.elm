import ElmTest exposing (..)
import Converter exposing (..)


romanToArabic : Test
romanToArabic =
  suite "Converting from Roman Numerals to Arabic"
    [ test "I -> 1" <| assertEqual (Ok "1") <| toArabic "I"
    , test "III -> 3" <| assertEqual (Ok "3") <| toArabic "III"
    , test "IX -> 9" <| assertEqual (Ok "9") <| toArabic "IX"
    , test "MLXVI -> 1066" <| assertEqual (Ok "1066") <| toArabic "MLXVI"
    , test "MCMLXXXIX -> 1989" <| assertEqual (Ok "1989") <| toArabic "MCMLXXXIX"
    , test "HIPALS -> Error" <| assertEqual (Err "Invalid input") <| toArabic "HIPALS"
    , test "10 -> Error" <| assertEqual (Err "Invalid input") <| toArabic "10"
    , test "'' -> 0" <| assertEqual (Ok "0") <| toArabic ""
    ]


arabicToRoman : Test
arabicToRoman =
  suite "Converting from Arabic to Roman Numerals"
    [ test "1 -> I" <| assertEqual (Ok "I") <| toRoman "1"
    , test "3 -> III" <| assertEqual (Ok "III") <| toRoman "3"
    , test "9 -> IX" <| assertEqual (Ok "IX") <| toRoman "9"
    , test "1066 -> MLXVI" <| assertEqual (Ok "MLXVI") <| toRoman "1066"
    , test "1989 -> MCMLXXXIX" <| assertEqual (Ok "MCMLXXXIX") <| toRoman "1989"
    , test "-1 -> Error" <| assertEqual (Err "Invalid input") <| toRoman "-1"
    , test "0 -> ''" <| assertEqual (Ok "") <| toRoman "0"
    , test "X -> Error" <| assertEqual (Err "Invalid input") <| toRoman "X"
    ]


tests : Test
tests =
  suite "Converting to and from Roman Numerals"
    [ arabicToRoman
    , romanToArabic
    ]


main : Program Never
main =
  runSuiteHtml tests
