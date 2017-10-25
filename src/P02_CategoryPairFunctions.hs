module P02_CategoryPairFunctions where

import Control.Category (Category, (.), id)
import Prelude hiding ((.), id)

pairCompose :: (Category cat1, Category cat2) => (cat1 b1 c1, cat2 b2 c2) -> (cat1 a1 b1, cat2 a2 b2) -> (cat1 a1 c1, cat2 a2 c2)
pairCompose (f1,f2) (g1,g2) = (f1 . g1, f2 . g2)

pairId :: (Category cat1, Category cat2) => (cat1 a1 a1, cat2 a2 a2)
pairId = (id, id)
