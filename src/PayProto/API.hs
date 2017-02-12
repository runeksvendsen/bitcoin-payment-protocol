
module PayProto.API where

import qualified PayProto       as P
import           Servant.API


type PaymentRequest
     = Get '[P.BTC_PAYREQ] P.PaymentRequest

type PaymentDeliver
     = ReqBody '[P.BTC_PAY] P.Payment
    :> Post '[P.BTC_PAYACK] P.PaymentACK




