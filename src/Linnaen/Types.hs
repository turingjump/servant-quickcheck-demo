module Linnaen.Types where

import Data.Aeson (FromJSON, ToJSON)
import qualified Data.Text as T
import GHC.Generics (Generic)
import Data.Int (Int32)
import Hasql.Class (Encodable, Decodable)


newtype Id = Id { getId :: Int32 }
  deriving (Eq, Ord, Show, Read, Generic, FromJSON, ToJSON, Encodable, Decodable)

data Discoverer = Discoverer
  { _discovererFirstName :: T.Text
  , _discovererLastName :: T.Text
  } deriving (Eq, Show, Read, Generic, FromJSON, ToJSON, Encodable, Decodable)

data Family = Family
  { _familyName :: T.Text
  , _familyDiscoverer :: Maybe Id
  } deriving (Eq, Show, Read, Generic, FromJSON, ToJSON, Encodable, Decodable)

data Genus = Genus
  { _genusName :: T.Text
  , _genusDiscoverer :: Maybe T.Text
  , _genusFamily :: Id
  } deriving (Eq, Show, Read, Generic, FromJSON, ToJSON, Encodable, Decodable)

data Species = Species
  { _speciesName :: T.Text
  , _speciesDiscoverer :: Maybe T.Text
  , _speciesGenus :: Id
  } deriving (Eq, Show, Read, Generic, FromJSON, ToJSON, Encodable, Decodable)
