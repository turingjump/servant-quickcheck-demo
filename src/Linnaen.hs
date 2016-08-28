module Linnaen
  ( LinnaenAPI
  , linnaenAPI
  , linnaenServer
  , DBSettings(..)
  ) where

import Data.String (IsString(fromString))
import Servant

import Linnaen.Types

-- | We now add a single endpoint
type LinnaenAPI = "family" :> Get '[JSON] [Family]

linnaenAPI :: Proxy LinnaenAPI
linnaenAPI = Proxy

linnaenServer :: DBSettings -> IO (Server LinnaenAPI)
linnaenServer = error "not implemented"

newtype DBSettings = DBSettings { dbName :: String }
  deriving (Eq, Show, Read)

instance IsString DBSettings where
  fromString = DBSettings . fromString
