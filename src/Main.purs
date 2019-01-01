module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

foreign import myForeignFunction :: Number -> Number

main :: Effect Unit
main = log $ show $ myForeignFunction 2.0
