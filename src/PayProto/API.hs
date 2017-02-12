
module PayProto.API where

import qualified PayProto       as P
import           Servant.API
import qualified Servant.API.ResponseHeaders    as H


type BinaryContent = H.Headers '[Header "Content-Transfer-Encoding" String]

type PaymentRequest
     = Get '[P.BTC_PAYREQ] (BinaryContent P.PaymentRequest)

type PaymentDeliver
     = ReqBody '[P.BTC_PAY] P.Payment
    :> Post '[P.BTC_PAYACK] (BinaryContent P.PaymentACK)




