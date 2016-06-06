module Main exposing (..)

import Html.App as Html
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type')
import String exposing (split, toInt)
import List exposing (head)
import Converter exposing (..)

main : Program Never
main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = \_ -> Sub.none
    }


type Msg
  = Roman String
  | Arabic String


type alias Model =
  { roman : String
  , arabic : String
  }


init : ( Model, Cmd Msg )
init =
  ( Model "" "", Cmd.none )


view : Model -> Html Msg
view model =
  text "hello"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Roman string ->
      ( { model
          | roman = string
          , arabic = toString <| toArabic string
        }, Cmd.none )

    Arabic string ->
      let
        stringParts =
          split "." string

        intPart =
          head stringParts
      in
        case intPart of
          Just s ->
            ( { model
                | arabic = s
                , roman = toRoman <| Result.withDefault 0 <| toInt s
              }, Cmd.none )

          Nothing ->
            ( model, Cmd.none )

