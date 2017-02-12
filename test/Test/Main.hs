module Test.Main where

import qualified Test.Handlers.PayAck as Handler
import qualified Test.Handlers.PayReq as Handler
import           PayProto.API

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
main = run 8080 app


