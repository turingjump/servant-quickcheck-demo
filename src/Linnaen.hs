{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Linnaen
  ( LinnaenAPI
  , linnaenAPI
  , linnaenServer
  , DBSettings(..)
  ) where

import Data.String (IsString)
import Data.ByteString (ByteString)
import Servant

-- | We start off with a completely empty API.
-- This won't even typecheck.
type LinnaenAPI = ()

linnaenAPI :: Proxy LinnaenAPI
linnaenAPI = Proxy

linnaenServer :: DBSettings -> IO (Server LinnaenAPI)
linnaenServer = error "not implemented"

newtype DBSettings = DBSettings { dbName :: String }
  deriving (Eq, Show, Read, IsString)
