module Test.Constants where

import           Test.Util

import qualified Data.ByteString                as BS
import qualified Data.Text                      as T
import qualified Network.Haskoin.Crypto         as HC


testAddress :: HC.Address
testAddress = "1KAjXZxcNKjmGJsxix3pnuXGcMS2ZWsFQk"

testOutValue :: Word64
testOutValue = round (1e6 :: Double)

testMerchantData :: BS.ByteString
testMerchantData = ">>>00-abcd=dcba-00<<<"

testMerchantMemo :: T.Text
testMerchantMemo = "This is a memo, 123."

testPayAckMemo :: T.Text
testPayAckMemo = "Thank you, please come again"


