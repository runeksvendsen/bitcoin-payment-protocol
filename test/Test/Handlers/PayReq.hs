module Test.Handlers.PayReq where

import qualified PayProto as P
import           PayProto.API
import           Test.Constants
import           Test.Util

import Data.ProtoLens
import Servant
import Data.Time.Clock.POSIX

-- Hey
import Servant.Common.BaseUrl



-- | Respond with PaymentRequest
payRequestH :: Maybe String -> Handler (BinaryContent P.PaymentRequest)
payRequestH hostM = do
    payReq <- maybe (userErr "Missing Host HTTP header") mkSpec hostM >>= mkPayRequest
    return $ binaryHeader payReq
  where
    mkPayUrl h = BaseUrl Https (cs h) 443 "/pay_deliver"
    mkSpec host = return $ PayReqSpec
            [ (testAddress, testOutValue), (testAddress, testOutValue) ]
            (mkPayUrl host)
            (round $ 10 * 3600)
            testMerchantData


mkPayRequest :: PayReqSpec -> Handler P.PaymentRequest
mkPayRequest PayReqSpec{..} = do
    now <- liftIO $ round . utcTimeToPOSIXSeconds <$> getCurrentTime
    let payDetails = mkPayDetails now
    return $ P.PaymentRequest Nothing Nothing Nothing (encodeMessage payDetails) Nothing
  where
    mkOut (adr,val) = P.Output (Just val) (addressScriptBS adr)
    mkPayDetails ts =
        P.PaymentDetails
            Nothing                 -- Default/main network
            (map mkOut prsOuts)
            ts
            (Just $ ts + prsExpSecs)
            (Just testMerchantMemo)
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
  , prsMerchData    :: ByteString
  -- ^ Arbitrary data that will be echoed back to the server by
  --    the client when payment is delivered
  }
