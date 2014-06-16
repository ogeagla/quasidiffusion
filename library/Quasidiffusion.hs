-- | Quasidiffusion module.
module Quasidiffusion (quasidiffusion) where
import qualified Data.Array.Repa as R
import qualified Data.Array.Repa.IO.BMP as RIOB
import qualified Data.Array.Repa.IO.Matrix as RIOM

{- |
     This contains blah blah blah

     >>> quasidiffusion
     ()
-}
quasidiffusion :: ()
quasidiffusion = ()

type DIM6 = R.DIM5  R.:.  R.Z
type DIM7 =   DIM6  R.:.  R.Z
type DIM8 =   DIM7  R.:.  R.Z
type DIM9 =   DIM8  R.:.  R.Z
type DIM10 =  DIM9  R.:.  R.Z
type DIM11 =  DIM10 R.:.  R.Z

--for phase space of 3 dims
type PhaseSpace = R.Array R.U R.DIM3 Double

quadrature_order :: Int
quadrature_order = 8

group_count :: Int
group_count = 6

physical_mesh_size :: Int
physical_mesh_size = 10

physical_length :: Double
physical_length = 2.0

phase_space_cell_count :: Int
phase_space_cell_count = quadrature_order*group_count*physical_mesh_size

--this seems like an ugle hack, but at least it's explicit?
phase_space_cell_count_d :: Double
phase_space_cell_count_d = (fromIntegral quadrature_order) *(fromIntegral group_count) * (fromIntegral physical_mesh_size)


phase_space :: PhaseSpace
phase_space = R.fromListUnboxed (R.Z R.:. (quadrature_order::Int) R.:. (group_count::Int) R.:. (physical_mesh_size)) [1.0..phase_space_cell_count_d]





phi :: R.Array R.U R.DIM1 Double
phi = R.fromListUnboxed (R.Z R.:. (3::Int)) [1.0..3.0]
xt = R.extent phi

inputs = [1..25] :: [Double]
phi2 :: R.Array R.U R.DIM2 Double
phi2 = R.fromListUnboxed (R.Z R.:. (5::Int) R.:. (5::Int)) inputs


{-
Prelude Data.Array.Repa.IO.Matrix> :t writeMatrixToTextFile 
writeMatrixToTextFile
  :: (Show e, repa-3.2.3.3:Data.Array.Repa.Base.Source r e) =>
     FilePath
     -> repa-3.2.3.3:Data.Array.Repa.Base.Array
          r Data.Array.Repa.Index.DIM2 e
     -> IO ()
-}

writeData = RIOM.writeMatrixToTextFile "test.dat" phi2

