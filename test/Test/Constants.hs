module Test.Constants where

import           Test.Util

import qualified Data.ByteString                as BS
import qualified Data.Text                      as T
import qualified Network.Haskoin.Crypto         as HC


testAddress :: HC.Address
testAddress = "1KAjXZxcNKjmGJsxix3pnuXGcMS2ZWsFQk"

outputValue :: Word64
outputValue = round (1e6 :: Double)

merchantTestData :: BS.ByteString
merchantTestData = ">>>00-abcd=dcba-00<<<"

merchantTestMemo :: T.Text
merchantTestMemo = "This is a memo, 123."

payAckMsg :: T.Text
payAckMsg = "Thank you, please come again"


