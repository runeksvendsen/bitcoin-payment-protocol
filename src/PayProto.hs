module PayProto
( module PayProto
, module Proto.PayReq
)
where

import Data.ProtoLens
import Proto.PayReq
import qualified Data.ByteString.Lazy as BL
import Servant.API
import qualified Network.HTTP.Media as M
import qualified Network.Haskoin.Transaction    as HT

-- https://github.com/bitcoin/bips/blob/master/bip-0071.mediawiki#Specification
-- TODO: "Content-Transfer-Encoding: binary"


data BTC_PAYREQ
data BTC_PAY
data BTC_PAYACK

instance Accept BTC_PAYREQ where
    contentType _ = "application" M.// "bitcoin-paymentrequest"

instance Accept BTC_PAY where
    contentType _ = "application" M.// "bitcoin-payment"

instance Accept BTC_PAYACK where
    contentType _ = "application" M.// "bitcoin-paymentack"


instance MimeRender BTC_PAYREQ PaymentRequest where
    mimeRender _ = BL.fromStrict . encodeMessage
instance MimeUnrender BTC_PAYREQ PaymentRequest where
    mimeUnrender _ = decodeMessage . BL.toStrict

instance MimeRender BTC_PAY Payment where
    mimeRender _ = BL.fromStrict . encodeMessage
instance MimeUnrender BTC_PAY Payment where
    mimeUnrender _ = decodeMessage . BL.toStrict

instance MimeRender BTC_PAYACK PaymentACK where
    mimeRender _ = BL.fromStrict . encodeMessage
instance MimeUnrender BTC_PAYACK PaymentACK where
    mimeUnrender _ = decodeMessage . BL.toStrict


-- toHaskoinOut :: Output -> HT.TxOut

