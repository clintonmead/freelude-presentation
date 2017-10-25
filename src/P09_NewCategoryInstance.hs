{-# LANGUAGE TypeFamilyDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module P09_NewCategoryInstance where

import P08_CategoryAttempt2
import Prelude hiding ((.), id)

data PairP cat1 cat2

type family Fst t where
  Fst (a,_) = a

type family Snd t where
  Snd (_,a) = a

type instance CategoryT (PairP cat1 cat2) (a1,a2) (b1,b2) = (CategoryT cat1 a1 b1, CategoryT cat2 a2 b2)
type instance CategoryC (PairP cat1 cat2) a = (a ~ (Fst a, Snd a), CategoryC cat1 (Fst a), CategoryC cat2 (Snd a))

instance (Category cat1, Category cat2) => Category (PairP cat1 cat2) where
  (f1,f2) . (g1,g2) = (f1 . g1, f2 . g2)
  id = (id, id)
