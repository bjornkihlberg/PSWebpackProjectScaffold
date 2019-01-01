module Test.Main where

import Prelude

import Effect (Effect)
import Main (myForeignFunction)
import Test.Unit (test)
import Test.Unit.Assert (assert)
import Test.Unit.Main (runTest)
import Test.Unit.QuickCheck (quickCheck)

main :: Effect Unit
main = runTest do
    test "My tests" do
        assert "f should double" $ myForeignFunction 5.0 == 10.0
        quickCheck \x -> f x /= x -- quickCheck may not be a proper quick check
