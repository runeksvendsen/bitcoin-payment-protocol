{-|
Module      : PayProto
Description : Bitcoin Payment Protocol (BIP70)
Copyright   : (c) Rune K. Svendsen, 2016
License     : PublicDomain
Maintainer  : runesvend@gmail.com
Stability   : experimental
Portability : POSIX

Message types and content types for Bitcoin Payment Protocol (BIP70).

-}
module PayProto
( module PayProto
, module PayProto.Gen.PayReq
)
where

import PayProto.Util
import PayProto.Gen.PayReq
import Data.ProtoLens
import Servant.API
import Data.Word (Word64)
import Data.Time.Clock.POSIX
import Data.Time.Clock
import Servant.Common.BaseUrl
import Network.Haskoin.Crypto

import qualified Data.ByteString.Lazy     as BL
import qualified Data.ByteString          as BS
import qualified Network.HTTP.Media       as M
import qualified Data.Text                 as T
import qualified Network.Haskoin.Constants as HCC


-- | Create 'PaymentRequest' from current time + 'PayReqSpec'
mkPayRequestT :: UTCTime -> PayReqSpec -> PaymentRequest
mkPayRequestT now PayReqSpec{..} = do
    let payDetails = mkPayDetails now
    PaymentRequest Nothing Nothing Nothing (encodeMessage payDetails) Nothing
  where
    mkOut (adr,val) = Output (Just val) (addressScriptBS adr)
    mkPayDetails now' =
      let
          ts = round . utcTimeToPOSIXSeconds $ now'
          liveOrTestnet =
              if HCC.getNetworkName HCC.getNetwork == "testnet"
                  then Just "test"
                  else Just "main"
      in PaymentDetails
            liveOrTestnet              -- Default/main network
            (map mkOut prsOuts)
            ts
            (Just $ ts + prsExpSecs)
            (Just prsMerchMemo)
            (Just . cs $ show prsPayUrl)
            (Just prsMerchData)


data PayReqSpec = PayReqSpec
  { prsOuts         :: [(Address, Word64)]
  -- ^ Request payment to these (address,value) pairs
  , prsPayUrl       :: BaseUrl
  -- ^ The client will POST the paying Bitcoin tx to this URL
  , prsExpSecs      :: Word64
  -- ^ The client is ordered to make payment no later than this
  --    many seconds after the payment request was sent
  , prsMerchMemo    :: T.Text
  -- ^ Message that will be displayed to the user
  , prsMerchData    :: BS.ByteString
  -- ^ Arbitrary data that will be echoed back to the server by
  --    the client when payment is delivered
  }


-- https://github.com/bitcoin/bips/blob/master/bip-0071.mediawiki#Specification
data PAYREQ
data PAY
data PAYACK

instance Accept PAYREQ where
    contentType _ = "application" M.// "bitcoin-paymentrequest"

instance Accept PAY where
    contentType _ = "application" M.// "bitcoin-payment"

instance Accept PAYACK where
    contentType _ = "application" M.// "bitcoin-paymentack"


instance MimeRender PAYREQ PaymentRequest where
    mimeRender _ = BL.fromStrict . encodeMessage
instance MimeUnrender PAYREQ PaymentRequest where
    mimeUnrender _ = decodeMessage . BL.toStrict

instance MimeRender PAY Payment where
    mimeRender _ = BL.fromStrict . encodeMessage
instance MimeUnrender PAY Payment where
    mimeUnrender _ = decodeMessage . BL.toStrict

instance MimeRender PAYACK PaymentACK where
    mimeRender _ = BL.fromStrict . encodeMessage
instance MimeUnrender PAYACK PaymentACK where
    mimeUnrender _ = decodeMessage . BL.toStrict

