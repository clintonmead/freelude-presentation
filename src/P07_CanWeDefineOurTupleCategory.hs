{-# LANGUAGE TypeFamilyDependencies #-}

-- This doesn't work.

module P07_CanWeDefineOurTupleCategory where

import P05_LetsWriteOurOwnCategory
import Prelude hiding ((.), id)

data PairP cat1 cat2

type instance CategoryT (PairP cat1 cat2) (a1,a2) (b1,b2) = (CategoryT cat1 a1 b1, CategoryT cat2 a2 b2)

instance (Category cat1, Category cat2) => Category (PairP cat1 cat2) where
  (f1,f2) . (g1,g2) = (f1 . g1, f2 . g2)
