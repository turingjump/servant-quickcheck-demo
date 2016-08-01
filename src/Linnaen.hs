module Linnaen
  ( run
  , LinnaenAPI
  ) where

type LinnaenAPI = _

linnaenAPI :: Proxy LinnaenAPI
linnaenAPI = Proxy

run :: Config -> IO ()
run =

data Config
