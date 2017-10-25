{-# LANGUAGE GADTs #-}

module P03_CategoryPairAttempt where

import Control.Category (Category, (.), id)
import Prelude hiding ((.), id)
import qualified Prelude

data CategoryPair c1 c2 a b where
  CategoryPair :: c1 a1 b1 -> c2 a2 b2 -> CategoryPair c1 c2 (a1, a2) (b1, b2)

instance (Category c1, Category c2) => Category (CategoryPair c1 c2) where
  CategoryPair x1 x2 . CategoryPair y1 y2 = CategoryPair (x1 . y1) (x2 . y2)
  id = CategoryPair id id
