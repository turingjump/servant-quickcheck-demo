module Linnaen.DB where

import qualified Hasql.Decoder as Dec

listFamily :: Query () Family
listFamily = _
  where
    sql = "SELECT (family_name) FROM family;"
