module QuasidiffusionBench (benchmarks) where

import Criterion (Benchmark, bench, nf)
import Quasidiffusion (quasidiffusion)

benchmarks :: [Benchmark]
benchmarks =
  [ bench "quasidiffusion" (nf (const quasidiffusion) ())
  ]
