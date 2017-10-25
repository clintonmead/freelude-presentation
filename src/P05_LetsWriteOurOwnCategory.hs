{-# LANGUAGE TypeFamilyDependencies #-}

module P05_LetsWriteOurOwnCategory where

import Prelude hiding ((.), id)

type family CategoryT cat a b = t | t -> cat a b

class Category cat where
  (.) :: CategoryT cat b c -> CategoryT cat a b -> CategoryT cat a c
  id :: CategoryT cat a a

-- Lets test associativity

eqT :: a -> a -> ()
eqT _ _ = ()

catAssociative :: Category cat => CategoryT cat c d -> CategoryT cat b c -> CategoryT cat a b -> ()
catAssociative x y z = ((x . y) . z) `eqT` (x . (y . z))
