module AddNumbers exposing (main)

import Browser
import Html exposing (Html, div, span, text, input, button, label, br)
import Html.Events exposing (onClick, onInput)
-- import Debug exposing (log)

import String exposing (fromInt, toInt)
add : Int -> Int -> Int
add a b = a + b

type alias Model = {
        a : Int,
        b: Int,
        value: Int
    }   
init : Model
init = { a = 0, b = 0, value = 0}
main : Program() Model Messages
main = 
    Browser.sandbox {
        init = init
        , view = view
        , update = update
    }
 
type Messages = Add | UpdateA String | UpdateB String
view : Model -> Html Messages
view model =
    div [] [
        br [] [],
        span [] [label [] [text "a: "], input [onInput UpdateA] []],
        text " ", -- Adds space
        span [] [label [] [text "b: "], input [onInput UpdateB] []],
        text " ",
        button [onClick Add ] [text "Add"],
        br [] [],
        br [] [],
        span [] [label [] [text "Result: "], text (fromInt model.value)]
    ]

parseNumber : String -> Int
parseNumber s = 
        let mayBeNum =  toInt s 
        in
        case mayBeNum of
            Just n -> n
            _ -> 0

update : Messages -> Model -> Model

update msg model = 
    case msg of
       Add -> {model | value = add model.a model.b}
       UpdateA aStr -> {model | a = parseNumber aStr}
       UpdateB bStr -> {model | b = parseNumber bStr}

    