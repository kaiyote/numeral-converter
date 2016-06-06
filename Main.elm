module Main exposing (..)

import Html.App as Html
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type', placeholder, style, value)
import Html.Events exposing (onInput)
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
  , error : String
  }


init : ( Model, Cmd Msg )
init =
  ( Model "" "" "", Cmd.none )


view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "Roman Numerals", value model.roman, onInput Roman ] []
    , input [ type' "text", placeholder "Arabic Numbers (integers only)", value model.arabic, onInput Arabic ] []
    , div [ style [ ( "color", "red" ) ] ] [ text model.error]
    ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Roman string ->
      let
        arabic =
          toArabic string
      in
        case arabic of
          Ok result ->
            ({ model
                | roman = string
                , arabic = result
                , error = ""
                } , Cmd.none )
          Err err ->
            ( { model
                | roman = string
                , arabic = ""
                , error = err
                } , Cmd.none)

    Arabic string ->
      let
        roman =
          toRoman string
      in
        case roman of
          Ok result ->
            ( { model
                | roman = result
                , arabic = string
                , error = ""
                } , Cmd.none )
          Err err ->
            ( { model
                | roman = ""
                , arabic = string
                , error = err
                } , Cmd.none)

