module Test.Handlers.PayAck where

import Test.Constants
import Test.Util
import PayProto.API
import qualified PayProto as P

import Servant
import qualified Network.Haskoin.Transaction    as HT
import qualified Data.Serialize                 as Bin


-- | Respond to Payment with PaymentACK or 400 error
payDeliverH :: P.Payment -> Handler (BinaryContent P.PaymentACK)
payDeliverH p@(P.Payment (Just merchData) _ _ _)
    | merchData /= testMerchantData =
        userErr $ "Incorrect merchant data. Expected: " <> testMerchantData
    | otherwise = handlePayment p
payDeliverH (P.Payment Nothing  _ _ _) = userErr "Missing merchant data"


-- | Respond with PaymentACK
handlePayment :: P.Payment -> Handler (BinaryContent P.PaymentACK)
handlePayment p@(P.Payment _ txBsL refundOutL _) = do
    let txL = rights $ map Bin.decode txBsL
    liftIO $ do
            putStrLn $ "Got these txs: " ++ show (txL :: [HT.Tx])
            putStrLn $ "And these refundOuts: " ++ show refundOutL
    return $ binaryHeader $ P.PaymentACK p (Just testPayAckMemo)

