import ElmTest exposing (..)
import Converter exposing (..)


romanToArabic : Test
romanToArabic =
  suite "Converting from Roman Numerals to Arabic"
    [ test "I -> 1" <| assertEqual 1 <| toArabic "I"
    , test "III -> 3" <| assertEqual 3 <| toArabic "III"
    , test "IX -> 9" <| assertEqual 9 <| toArabic "IX"
    , test "MLXVI -> 1066" <| assertEqual 1066 <| toArabic "MLXVI"
    , test "MCMLXXXIX -> 1989" <| assertEqual 1989 <| toArabic "MCMLXXXIX"
    ]


arabicToRoman : Test
arabicToRoman =
  suite "Converting from Arabic to Roman Numerals"
    [ test "1 -> I" <| assertEqual "I" <| toRoman 1
    , test "3 -> III" <| assertEqual "III" <| toRoman 3
    , test "9 -> IX" <| assertEqual "IX" <| toRoman 9
    , test "1066 -> MLXVI" <| assertEqual "MLXVI" <| toRoman 1066
    , test "1989 -> MCMLXXXIX" <| assertEqual "MCMLXXXIX" <| toRoman 1989
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
