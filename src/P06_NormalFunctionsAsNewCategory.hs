{-# LANGUAGE TypeFamilyDependencies #-}

module P06_NormalFunctionsAsNewCategory where

import P05_LetsWriteOurOwnCategory

import Prelude hiding ((.), id)
import qualified Prelude

data FunctionP

type instance CategoryT FunctionP a b = a -> b

instance Category FunctionP where
  (.) = (Prelude..)
  id = Prelude.id
