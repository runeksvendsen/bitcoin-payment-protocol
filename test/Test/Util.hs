module Test.Util
( module Test.Util
, module Ex
)
where


import qualified Servant        as S
import Control.Monad.IO.Class   as Ex
import Data.Word                as Ex
import Data.String.Conversions  as Ex
import Data.Either              as Ex

import qualified Data.ByteString        as BS
import qualified Data.ByteString.Lazy   as BL
import qualified Network.Haskoin.Crypto as HC
import qualified Network.Haskoin.Script as HS


userErr :: BS.ByteString -> S.Handler a
userErr msg = S.throwError $ S.err404 { S.errBody = BL.fromStrict msg }

addressToScript :: HC.Address -> HS.ScriptOutput
addressToScript addr =
    case addr of
        a@(HC.PubKeyAddress _) -> HS.PayPKHash a
        a@(HC.ScriptAddress _) -> HS.PayScriptHash a

addressScriptBS :: HC.Address -> BS.ByteString
addressScriptBS = HS.encodeOutputBS . addressToScript
