module Index exposing (main)

import Browser
import Html exposing (Html, div, text, ul, li, a, span, h3)
import Html.Attributes exposing (href)

type alias Model = {}

main : Program() Model msg

main = 
    Browser.sandbox {
        init = Model,
        view = view,
        update = update
    }
 
 
view : Model -> Html msg
view _ =
    div [] [
       span [] [h3 [] [text "Elm Examples"] ],
       ul [] [
           li [] [
               a [ href "http://localhost:8000/src/AddNumbers.elm"] [text "Add numbers"]
           ]
       ]
    ]

update: msg -> model -> model
update _ model = model
