module PayProto.API
( module PayProto.API
)
where


import qualified PayProto       as P
import           Servant.API
import qualified Servant.API.ResponseHeaders    as H


-- | Payment protocol messages use binary encoding
type BinaryContent = H.Headers '[Header "Content-Transfer-Encoding" String]

-- | An endpoint that responds with a 'P.PaymentRequest'
type PaymentRequest
     = Header "Host" String :> Get '[P.PAYREQ] (BinaryContent P.PaymentRequest)

-- | An endpoint that accepts a 'P.Payment' and responds with a 'P.PaymentACK'
type PaymentDeliver
     = ReqBody '[P.PAY] P.Payment
    :> Post '[P.PAYACK] (BinaryContent P.PaymentACK)




