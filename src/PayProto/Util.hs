module PayProto.Util
( module PayProto.Util
, cs
)
where

import           Data.String.Conversions (cs)
import qualified Data.ByteString        as BS
import qualified Network.Haskoin.Crypto as HC
import qualified Network.Haskoin.Script as HS


-- Bitcoin
addressToScript :: HC.Address -> HS.ScriptOutput
addressToScript addr =
    case addr of
        a@(HC.PubKeyAddress _) -> HS.PayPKHash a
        a@(HC.ScriptAddress _) -> HS.PayScriptHash a

addressScriptBS :: HC.Address -> BS.ByteString
addressScriptBS = HS.encodeOutputBS . addressToScript
