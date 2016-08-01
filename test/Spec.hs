module Spec (main) where

import Control.Exception (bracket)
import System.Process (spawnCommand, terminateProcess)
import Test.Hspec (describe, it, pending)
import Servant.QuickCheck

import Linnaen (LinnaenAPI)

main :: IO ()
main = _ rewriteSpec

rewriteSpec :: Spec
rewriteSpec = describe "the application" $ do

  it "should match the behaviour of the legacy application" $ do
    let localhost port = BaseUrl "localhost" port ""
    withLegacyApplication $ withServantServer $ \thisPort ->
      serversEqual linnaenAPI (localhost thisPort) (localhost legacyPort)


withLegacyApplication :: IO a -> IO a
withLegacyApplication action
  = bracket (spawnCommand "run-legacy-app")
            terminateProcess
            (const action)

legacyPort :: Port
legacyPort = _
