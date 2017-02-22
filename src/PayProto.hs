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
, module Proto.PayReq
)
where

import Data.ProtoLens
import Proto.PayReq
import qualified Data.ByteString.Lazy     as BL
import qualified Network.HTTP.Media       as M
import Servant.API



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

