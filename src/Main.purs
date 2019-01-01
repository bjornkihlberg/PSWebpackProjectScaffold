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

data Action = Increment | Decrement

data Query action a = Query action a

type QueryAction = Query Action

data Message = Message

myComponent :: forall m. H.Component HH.HTML QueryAction Input Message m
myComponent =
    H.component
        { initialState
        , render
        , eval
        , receiver: const Nothing
        }
    where

    initialState :: forall a. a -> State
    initialState = const { i: 0 }

    render :: State -> H.ComponentHTML QueryAction
    render { i } =
        HH.div []
        [ HH.h1 [] [ HH.text $ show i ]
        , HH.button
            [ HP.title "Let's increment!"
            , HE.onClick (HE.input_ (Query Increment))
            ]
            [ HH.text "Increment" ]
        , HH.button
            [ HP.title "Let's decrement!"
            , HE.onClick (HE.input_ (Query Decrement))
            ]
            [ HH.text "Decrement" ]
        ]

    update :: Action -> State -> State
    update Increment state = state { i = state.i + myForeignFunction 1 }
    update Decrement state = state { i = state.i - myForeignFunction 1 }

    eval :: QueryAction ~> H.ComponentDSL State QueryAction Message m
    eval (Query action next) = do
        H.modify_ $ update action
        pure next

main :: Effect Unit
main = runHalogenAff $ awaitBody >>= runUI myComponent unit
