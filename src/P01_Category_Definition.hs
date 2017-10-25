-- This is the ordinary definition of category:

module P01_Category_Definition where

import Prelude hiding ((.), id)
import qualified Prelude

class Category cat where
  id :: cat a a
  (.) :: cat b c -> cat a b -> cat a c

-- Normal function deinition

instance Category (->) where
  id = \x -> x
  f . g = \x -> f (g x)


{-
I want to be able to do this:

(f1,f2) . (g1,g2) == (f1 . g1, f2 . g2)
-}
