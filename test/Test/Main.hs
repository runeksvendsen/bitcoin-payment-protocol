module Test.Main where

import           Test.Util

import           PayProto.API
import qualified PayProto as P
import           Data.ProtoLens

import Servant.API
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Data.Time.Clock.POSIX
import qualified Data.ByteString                as BS
import qualified Data.Text                      as T
import qualified Network.Haskoin.Transaction    as HT
import qualified Network.Haskoin.Crypto         as HC
import qualified Data.Serialize                 as Bin


testAddress :: HC.Address
testAddress = "1KAjXZxcNKjmGJsxix3pnuXGcMS2ZWsFQk"

serverBaseUrl :: T.Text
serverBaseUrl = "https://runeks.me/"

outputValue :: Word64
outputValue = round (1e6 :: Double)

merchantTestData :: BS.ByteString
merchantTestData = ">>>00-abcd=dcba-00<<<"

merchantTestMemo :: T.Text
merchantTestMemo = "This is a memo, 123."


type PayReqAPI     = "pay_request" :> PaymentRequest    --  GET
type PayDeliverAPI = "pay_deliver" :> PaymentDeliver    -- POST

type UserPayAPI = PayReqAPI :<|> PayDeliverAPI



server :: Server UserPayAPI
server = payRequestH :<|> payDeliverH


payRequestH :: Handler P.PaymentRequest
payRequestH = do
    now <- liftIO $ round . utcTimeToPOSIXSeconds <$> getCurrentTime
    let payDetails = mkPayDetails outputValue now
    return $ P.PaymentRequest Nothing Nothing Nothing (encodeMessage payDetails) Nothing
  where
    payUrl = serverBaseUrl <> "pay_deliver"
    mkPayDetails val ts =
        P.PaymentDetails
            Nothing                 -- Default network
            [mkOut val, mkOut val]
            ts
            (Just $ ts + 36000)     -- Expiration
            (Just merchantTestMemo)
            (Just payUrl)
            (Just merchantTestData)
    mkOut val = P.Output (Just val) (addressScriptBS testAddress)

handlePayment :: P.Payment -> Handler P.PaymentACK
handlePayment p@(P.Payment _ txBsL refundOutL _) = do
    let txL = rights $ map Bin.decode txBsL
    liftIO $ do
            putStrLn $ "Got these txs: " ++ show (txL :: [HT.Tx])
            putStrLn $ "And these refundOuts: " ++ show refundOutL
    return $ P.PaymentACK p (Just "Thank you, please come again")

payDeliverH :: P.Payment -> Handler P.PaymentACK
payDeliverH p@(P.Payment (Just merchData) _ _ (Just merchMemo))
    | merchData /= merchantTestData =
        userErr $ "Incorrect merchant data. Expected: " <> merchantTestData
    | merchMemo /= merchantTestMemo =
        userErr $ "Incorrect memo data. Expected: " <> cs merchantTestMemo
    | otherwise = handlePayment p
payDeliverH (P.Payment Nothing _ _ (Just _)) = userErr "Missing merchant data"
payDeliverH (P.Payment (Just _) _ _ Nothing) = userErr "Missing memo"
payDeliverH (P.Payment Nothing _ _ Nothing) = userErr "Missing memo & merchant data"

userAPI :: Proxy UserPayAPI
userAPI = Proxy

app :: Application
app = serve userAPI server

main :: IO ()
main = run 8080 app

