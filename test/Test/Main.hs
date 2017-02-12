module Test.Main where

import Test.Util
import PayProto.API
import qualified Test.Handlers.PayAck as Handler
import qualified Test.Handlers.PayReq as Handler

import Servant.API
import Network.Wai
import Network.Wai.Handler.Warp
import Servant


type PayReqAPI     = "pay_request" :> PaymentRequest    --  GET
type PayDeliverAPI = "pay_deliver" :> PaymentDeliver    -- POST

type UserPayAPI = PayReqAPI :<|> PayDeliverAPI


server :: Server UserPayAPI
server = Handler.payRequestH :<|> Handler.payDeliverH

userAPI :: Proxy UserPayAPI
userAPI = Proxy

app :: Application
app = serve userAPI server

main :: IO ()
main =
    envReadPort >>= runApp . (fromMaybe 8080)
  where
    runApp port = run (fromIntegral port) app

