{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

{- |
Description : Delimited continuations
-}
module Control.Dsl.Shift where

import Data.Void
import Control.Dsl.Cont
import Control.Dsl.PolyCont
import Prelude hiding ((>>), (>>=), return)

newtype Shift r0 r a = Shift (r0 !! a)

instance PolyCont (Shift r) r a where
  runPolyCont (Shift k) f = k f
