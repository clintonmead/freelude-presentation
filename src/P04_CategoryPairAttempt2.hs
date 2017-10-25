{-# LANGUAGE GADTs #-}

module P04_CategoryPairAttempt2 where

import Control.Category (Category, (.), id)
import Prelude hiding ((.), id)

data CategoryPair c1 c2 a b where
  CategoryPair :: c1 a1 b1 -> c2 a2 b2 -> CategoryPair c1 c2 (a1, a2) (b1, b2)
  CategoryId :: CategoryPair c1 c2 a a

instance (Category c1, Category c2) => Category (CategoryPair c1 c2) where
  CategoryPair f1 f2 . CategoryPair g1 g2 = CategoryPair (f1 . g1) (f2 . g2)
  CategoryId . g = g
  f . CategoryId = f
  id = CategoryId
