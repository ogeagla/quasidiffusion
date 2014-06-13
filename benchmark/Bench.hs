module Main (main) where

import Criterion.Main(bgroup, defaultMain)
import qualified QuasidiffusionBench

main :: IO ()
main =
  [ bgroup "Quasidiffusion" QuasidiffusionBench.benchmarks
  ]
  
