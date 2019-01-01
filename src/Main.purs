module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Halogen as H
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)

foreign import myForeignFunction :: Int -> Int

type State = { i :: Int }

type Input = Unit

data Query a = Increment a | Decrement a

data Message = Incremented | Decremented

myComponent :: forall m. H.Component HH.HTML Query Input Message m
myComponent =
    H.component
        { initialState
        , render: view
        , eval
        , receiver: const Nothing
        }
    where

    initialState :: forall a. a -> State
    initialState = const { i: 0 }

    view :: State -> H.ComponentHTML Query
    view { i } =
        HH.div []
        [ HH.h1 [] [ HH.text $ show i ]
        , HH.button
            [ HP.title "Click me!"
            , HE.onClick (HE.input_ Increment)
            ]
            [ HH.text "Increment" ]
        , HH.button
            [ HP.title "Click me!"
            , HE.onClick (HE.input_ Decrement)
            ]
            [ HH.text "Decrement" ]
        ]

    eval :: Query ~> H.ComponentDSL State Query Message m
    eval (Increment next) = do
        H.modify_ \state -> state { i = state.i + myForeignFunction 1 }
        H.raise Incremented
        pure next
    eval (Decrement next) = do
        H.modify_ \state -> state { i = state.i - myForeignFunction 1 }
        H.raise Decremented
        pure next

main :: Effect Unit
main = runHalogenAff $ awaitBody >>= runUI myComponent unit
