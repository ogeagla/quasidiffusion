module QuasidiffusionSpec (spec) where

import Quasidiffusion (quasidiffusion)
import Test.Hspec
import Test.Hspec.QuickCheck

spec :: Spec
spec = 
    describe "quasidiffusion" $ do
        it "returns the unit value" $
            quasidiffusion `shouldBe` ()

        prop "equals the unit value" $
            \ x -> quasidiffusion == x
