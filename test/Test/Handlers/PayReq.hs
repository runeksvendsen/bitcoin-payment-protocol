module Test.Handlers.PayReq where

import qualified PayProto as P
import           PayProto.API
import           Test.Constants
import           Test.Util

import Data.ProtoLens
import Servant
import Data.Time.Clock.POSIX


-- | Respond with PaymentRequest
payRequestH :: String -> Handler (BinaryContent P.PaymentRequest)
payRequestH host = do
    now <- liftIO $ round . utcTimeToPOSIXSeconds <$> getCurrentTime
    let payDetails = mkPayDetails outputValue now
    return $ binaryHeader $ P.PaymentRequest Nothing Nothing Nothing (encodeMessage payDetails) Nothing
  where
    payUrl = "https://" <> cs host <> "/pay_deliver"
    mkPayDetails val ts =
        P.PaymentDetails
            Nothing                 -- Default/main network
            [mkOut val, mkOut val]  -- Request two outputs of equal value
            ts
            (Just $ ts + 10 * 3600) -- 10-hour expiration
            (Just merchantTestMemo)
            (Just payUrl)
            (Just merchantTestData)
    mkOut val = P.Output (Just val) (addressScriptBS testAddress)
