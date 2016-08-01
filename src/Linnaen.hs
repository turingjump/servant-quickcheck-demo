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

type LinnaenAPI = ()

linnaenAPI :: Proxy LinnaenAPI
linnaenAPI = Proxy

linnaenServer :: DBSettings -> IO (Server LinnaenAPI)
linnaenServer = error "not implemented"

newtype DBSettings = DBSettings { getDBSettings :: ByteString }
  deriving (Eq, Show, Read, IsString)
