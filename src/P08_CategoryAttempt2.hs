{-# LANGUAGE TypeFamilyDependencies #-}
{-# LANGUAGE ConstraintKinds #-}

module P08_CategoryAttempt2 where

import Prelude hiding ((.), id)
import GHC.Exts (Constraint)

type family CategoryT cat a b = t | t -> cat a b
type family CategoryC cat a :: Constraint

class Category cat where
  (.) :: (CategoryC cat a, CategoryC cat b, CategoryC cat c) => CategoryT cat b c -> CategoryT cat a b -> CategoryT cat a c
  id :: (CategoryC cat a) => CategoryT cat a a
