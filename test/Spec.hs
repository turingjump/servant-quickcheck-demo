module Spec (main) where

import Control.Exception  (bracket)
import Data.Monoid
import Data.String (fromString)
import Data.ByteString.Char8 (unpack)
import Servant.Client
import Servant.QuickCheck
import System.Process     (spawnCommand, terminateProcess)
import System.Process     (callCommand)
import System.Random (randomIO)
import Test.Hspec         (Spec, describe, hspec, it, pending)

import Linnaen
import Paths_hs_exchange

main :: IO ()
main = hspec rewriteSpec

-- * Tests proper

rewriteSpec :: Spec
rewriteSpec = describe "the application" $ do

  it "should match the behaviour of the legacy application" $ do
    withTestDatabase $ \db1 -> withTestDatabase $ \db2 -> withLegacyApplication db1 $
      withServantServer linnaenAPI (linnaenServer db2) $ \thisUrl ->
        serversEqual linnaenAPI thisUrl legacyUrl defaultArgs bodyEquality


-- * Setup and configurations

-- | Starts the legacy application, runs the action provided as argument,
-- and kills the legacy application process.
--
-- Assumes there's a 'run-app' executable that takes the connection strings as
-- command-line argument in the 'legacy' repository.
withLegacyApplication :: DBSettings -> IO a -> IO a
withLegacyApplication settings action
  = bracket (spawnCommand $ "./legacy/run-app " <> show legacyPort
                         <> " " <> dbName settings)
            terminateProcess
            (const action)

-- | Runs the provided action with a fresh database.
--
-- Assumes you are using PostgreSQL.
withTestDatabase :: (DBSettings -> IO a) -> IO a
withTestDatabase action = do
  name       <- (\x -> "linnaen_test_" <> show x) <$> (randomIO :: IO Int)
  schemaFile <- getDataFileName "test/schema.sql"

  callCommand $ createDB name
  callCommand $ "psql --file '" <> schemaFile <> "' " <> name
             <> " >/dev/null 2>/dev/null"
  result <- action $ fromString name
  callCommand $ dropDB name
  return result
  where
    dropDB   name = "dropdb " <> name <> " >/dev/null 2>/dev/null || true"
    createDB name = "createdb " <> name <> " >/dev/null 2>/dev/null || true"

legacyUrl :: BaseUrl
legacyUrl = BaseUrl Http "localhost" legacyPort ""

legacyPort :: Int
legacyPort = 8081
