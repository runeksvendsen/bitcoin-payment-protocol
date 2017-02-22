module Test.Handlers.PayReq where

import qualified PayProto as P
import           PayProto.API
import           Test.Constants
import           Test.Util
import qualified Network.Haskoin.Constants as HCC

import Data.ProtoLens
import Servant
import Data.Time.Clock.POSIX
import Data.Time.Clock

import Servant.Common.BaseUrl



-- | Respond with PaymentRequest
payRequestH :: Maybe String -> Handler (BinaryContent P.PaymentRequest)
payRequestH hostM = do
    payReq <- maybe (userErr "Missing Host HTTP header") mkSpec hostM >>= mkPayRequest
    return $ binaryHeader payReq
  where
    mkPayUrl h = BaseUrl Https (cs h) 443 "/pay_deliver"
    mkSpec host = return $ P.PayReqSpec
            [ (testAddress, testOutValue), (testAddress, testOutValue) ]
            (mkPayUrl host)
            (round $ 10 * 3600)
            testMerchantMemo
            testMerchantData

mkPayRequest :: P.PayReqSpec -> Handler P.PaymentRequest
mkPayRequest spec = do
    now <- liftIO getCurrentTime
    return $ P.mkPayRequestT now spec
