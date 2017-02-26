{- This file was auto-generated from pay_req.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
module PayProto.Gen.PayReq where
import qualified Prelude
import qualified Data.Int
import qualified Data.Word
import qualified Data.ProtoLens.Reexport.Data.ProtoLens
       as Data.ProtoLens
import qualified
       Data.ProtoLens.Reexport.Data.ProtoLens.Message.Enum
       as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Reexport.Lens.Family2
       as Lens.Family2
import qualified Data.ProtoLens.Reexport.Lens.Family2.Unchecked
       as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Reexport.Data.Default.Class
       as Data.Default.Class
import qualified Data.ProtoLens.Reexport.Data.Text as Data.Text
import qualified Data.ProtoLens.Reexport.Data.Map as Data.Map
import qualified Data.ProtoLens.Reexport.Data.ByteString
       as Data.ByteString

data Output = Output{_Output'amount ::
                     !(Prelude.Maybe Data.Word.Word64),
                     _Output'script :: !Data.ByteString.ByteString}
            deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "amount" Output =
     Data.Word.Word64

instance Data.ProtoLens.HasField "amount" Output Output where
        field _ = (Prelude..) maybe'amount (Data.ProtoLens.maybeLens 0)

type instance Data.ProtoLens.Field "maybe'amount" Output =
     Prelude.Maybe Data.Word.Word64

instance Data.ProtoLens.HasField "maybe'amount" Output Output where
        field _
          = Lens.Family2.Unchecked.lens _Output'amount
              (\ x__ y__ -> x__{_Output'amount = y__})

type instance Data.ProtoLens.Field "script" Output =
     Data.ByteString.ByteString

instance Data.ProtoLens.HasField "script" Output Output where
        field _
          = Lens.Family2.Unchecked.lens _Output'script
              (\ x__ y__ -> x__{_Output'script = y__})

instance Data.Default.Class.Default Output where
        def
          = Output{_Output'amount = Prelude.Nothing,
                   _Output'script = Data.ProtoLens.fieldDefault}

instance Data.ProtoLens.Message Output where
        descriptor
          = let amount__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "amount"
                      (Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.OptionalField maybe'amount)
                script__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "script"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required script)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, amount__field_descriptor),
                    (Data.ProtoLens.Tag 2, script__field_descriptor)])
                (Data.Map.fromList
                   [("amount", amount__field_descriptor),
                    ("script", script__field_descriptor)])

data Payment = Payment{_Payment'merchantData ::
                       !(Prelude.Maybe Data.ByteString.ByteString),
                       _Payment'transactions :: ![Data.ByteString.ByteString],
                       _Payment'refundTo :: ![Output],
                       _Payment'memo :: !(Prelude.Maybe Data.Text.Text)}
             deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "merchantData" Payment =
     Data.ByteString.ByteString

instance Data.ProtoLens.HasField "merchantData" Payment Payment
         where
        field _
          = (Prelude..) maybe'merchantData
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'merchantData" Payment =
     Prelude.Maybe Data.ByteString.ByteString

instance Data.ProtoLens.HasField "maybe'merchantData" Payment
         Payment where
        field _
          = Lens.Family2.Unchecked.lens _Payment'merchantData
              (\ x__ y__ -> x__{_Payment'merchantData = y__})

type instance Data.ProtoLens.Field "transactions" Payment =
     [Data.ByteString.ByteString]

instance Data.ProtoLens.HasField "transactions" Payment Payment
         where
        field _
          = Lens.Family2.Unchecked.lens _Payment'transactions
              (\ x__ y__ -> x__{_Payment'transactions = y__})

type instance Data.ProtoLens.Field "refundTo" Payment = [Output]

instance Data.ProtoLens.HasField "refundTo" Payment Payment where
        field _
          = Lens.Family2.Unchecked.lens _Payment'refundTo
              (\ x__ y__ -> x__{_Payment'refundTo = y__})

type instance Data.ProtoLens.Field "memo" Payment = Data.Text.Text

instance Data.ProtoLens.HasField "memo" Payment Payment where
        field _
          = (Prelude..) maybe'memo
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'memo" Payment =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'memo" Payment Payment where
        field _
          = Lens.Family2.Unchecked.lens _Payment'memo
              (\ x__ y__ -> x__{_Payment'memo = y__})

instance Data.Default.Class.Default Payment where
        def
          = Payment{_Payment'merchantData = Prelude.Nothing,
                    _Payment'transactions = [], _Payment'refundTo = [],
                    _Payment'memo = Prelude.Nothing}

instance Data.ProtoLens.Message Payment where
        descriptor
          = let merchantData__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "merchant_data"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField maybe'merchantData)
                transactions__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "transactions"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked transactions)
                refundTo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "refund_to"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor Output)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked refundTo)
                memo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "memo"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'memo)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, merchantData__field_descriptor),
                    (Data.ProtoLens.Tag 2, transactions__field_descriptor),
                    (Data.ProtoLens.Tag 3, refundTo__field_descriptor),
                    (Data.ProtoLens.Tag 4, memo__field_descriptor)])
                (Data.Map.fromList
                   [("merchant_data", merchantData__field_descriptor),
                    ("transactions", transactions__field_descriptor),
                    ("refund_to", refundTo__field_descriptor),
                    ("memo", memo__field_descriptor)])

data PaymentACK = PaymentACK{_PaymentACK'payment :: !Payment,
                             _PaymentACK'memo :: !(Prelude.Maybe Data.Text.Text)}
                deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "payment" PaymentACK = Payment

instance Data.ProtoLens.HasField "payment" PaymentACK PaymentACK
         where
        field _
          = Lens.Family2.Unchecked.lens _PaymentACK'payment
              (\ x__ y__ -> x__{_PaymentACK'payment = y__})

type instance Data.ProtoLens.Field "memo" PaymentACK =
     Data.Text.Text

instance Data.ProtoLens.HasField "memo" PaymentACK PaymentACK where
        field _
          = (Prelude..) maybe'memo
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'memo" PaymentACK =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'memo" PaymentACK PaymentACK
         where
        field _
          = Lens.Family2.Unchecked.lens _PaymentACK'memo
              (\ x__ y__ -> x__{_PaymentACK'memo = y__})

instance Data.Default.Class.Default PaymentACK where
        def
          = PaymentACK{_PaymentACK'payment = Data.Default.Class.def,
                       _PaymentACK'memo = Prelude.Nothing}

instance Data.ProtoLens.Message PaymentACK where
        descriptor
          = let payment__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "payment"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor Payment)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required payment)
                memo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "memo"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'memo)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, payment__field_descriptor),
                    (Data.ProtoLens.Tag 2, memo__field_descriptor)])
                (Data.Map.fromList
                   [("payment", payment__field_descriptor),
                    ("memo", memo__field_descriptor)])

data PaymentDetails = PaymentDetails{_PaymentDetails'network ::
                                     !(Prelude.Maybe Data.Text.Text),
                                     _PaymentDetails'outputs :: ![Output],
                                     _PaymentDetails'time :: !Data.Word.Word64,
                                     _PaymentDetails'expires :: !(Prelude.Maybe Data.Word.Word64),
                                     _PaymentDetails'memo :: !(Prelude.Maybe Data.Text.Text),
                                     _PaymentDetails'paymentUrl :: !(Prelude.Maybe Data.Text.Text),
                                     _PaymentDetails'merchantData ::
                                     !(Prelude.Maybe Data.ByteString.ByteString)}
                    deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "network" PaymentDetails =
     Data.Text.Text

instance Data.ProtoLens.HasField "network" PaymentDetails
         PaymentDetails where
        field _
          = (Prelude..) maybe'network
              (Data.ProtoLens.maybeLens (Data.Text.pack "main"))

type instance Data.ProtoLens.Field "maybe'network" PaymentDetails =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'network" PaymentDetails
         PaymentDetails where
        field _
          = Lens.Family2.Unchecked.lens _PaymentDetails'network
              (\ x__ y__ -> x__{_PaymentDetails'network = y__})

type instance Data.ProtoLens.Field "outputs" PaymentDetails =
     [Output]

instance Data.ProtoLens.HasField "outputs" PaymentDetails
         PaymentDetails where
        field _
          = Lens.Family2.Unchecked.lens _PaymentDetails'outputs
              (\ x__ y__ -> x__{_PaymentDetails'outputs = y__})

type instance Data.ProtoLens.Field "time" PaymentDetails =
     Data.Word.Word64

instance Data.ProtoLens.HasField "time" PaymentDetails
         PaymentDetails where
        field _
          = Lens.Family2.Unchecked.lens _PaymentDetails'time
              (\ x__ y__ -> x__{_PaymentDetails'time = y__})

type instance Data.ProtoLens.Field "expires" PaymentDetails =
     Data.Word.Word64

instance Data.ProtoLens.HasField "expires" PaymentDetails
         PaymentDetails where
        field _
          = (Prelude..) maybe'expires
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'expires" PaymentDetails =
     Prelude.Maybe Data.Word.Word64

instance Data.ProtoLens.HasField "maybe'expires" PaymentDetails
         PaymentDetails where
        field _
          = Lens.Family2.Unchecked.lens _PaymentDetails'expires
              (\ x__ y__ -> x__{_PaymentDetails'expires = y__})

type instance Data.ProtoLens.Field "memo" PaymentDetails =
     Data.Text.Text

instance Data.ProtoLens.HasField "memo" PaymentDetails
         PaymentDetails where
        field _
          = (Prelude..) maybe'memo
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'memo" PaymentDetails =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'memo" PaymentDetails
         PaymentDetails where
        field _
          = Lens.Family2.Unchecked.lens _PaymentDetails'memo
              (\ x__ y__ -> x__{_PaymentDetails'memo = y__})

type instance Data.ProtoLens.Field "paymentUrl" PaymentDetails =
     Data.Text.Text

instance Data.ProtoLens.HasField "paymentUrl" PaymentDetails
         PaymentDetails where
        field _
          = (Prelude..) maybe'paymentUrl
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'paymentUrl" PaymentDetails =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'paymentUrl" PaymentDetails
         PaymentDetails where
        field _
          = Lens.Family2.Unchecked.lens _PaymentDetails'paymentUrl
              (\ x__ y__ -> x__{_PaymentDetails'paymentUrl = y__})

type instance Data.ProtoLens.Field "merchantData" PaymentDetails =
     Data.ByteString.ByteString

instance Data.ProtoLens.HasField "merchantData" PaymentDetails
         PaymentDetails where
        field _
          = (Prelude..) maybe'merchantData
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'merchantData" PaymentDetails =
     Prelude.Maybe Data.ByteString.ByteString

instance Data.ProtoLens.HasField "maybe'merchantData"
         PaymentDetails PaymentDetails where
        field _
          = Lens.Family2.Unchecked.lens _PaymentDetails'merchantData
              (\ x__ y__ -> x__{_PaymentDetails'merchantData = y__})

instance Data.Default.Class.Default PaymentDetails where
        def
          = PaymentDetails{_PaymentDetails'network = Prelude.Nothing,
                           _PaymentDetails'outputs = [],
                           _PaymentDetails'time = Data.ProtoLens.fieldDefault,
                           _PaymentDetails'expires = Prelude.Nothing,
                           _PaymentDetails'memo = Prelude.Nothing,
                           _PaymentDetails'paymentUrl = Prelude.Nothing,
                           _PaymentDetails'merchantData = Prelude.Nothing}

instance Data.ProtoLens.Message PaymentDetails where
        descriptor
          = let network__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "network"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'network)
                outputs__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "outputs"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor Output)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked outputs)
                time__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "time"
                      (Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required time)
                expires__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "expires"
                      (Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.OptionalField maybe'expires)
                memo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "memo"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'memo)
                paymentUrl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "payment_url"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'paymentUrl)
                merchantData__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "merchant_data"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField maybe'merchantData)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, network__field_descriptor),
                    (Data.ProtoLens.Tag 2, outputs__field_descriptor),
                    (Data.ProtoLens.Tag 3, time__field_descriptor),
                    (Data.ProtoLens.Tag 4, expires__field_descriptor),
                    (Data.ProtoLens.Tag 5, memo__field_descriptor),
                    (Data.ProtoLens.Tag 6, paymentUrl__field_descriptor),
                    (Data.ProtoLens.Tag 7, merchantData__field_descriptor)])
                (Data.Map.fromList
                   [("network", network__field_descriptor),
                    ("outputs", outputs__field_descriptor),
                    ("time", time__field_descriptor),
                    ("expires", expires__field_descriptor),
                    ("memo", memo__field_descriptor),
                    ("payment_url", paymentUrl__field_descriptor),
                    ("merchant_data", merchantData__field_descriptor)])

data PaymentRequest = PaymentRequest{_PaymentRequest'paymentDetailsVersion
                                     :: !(Prelude.Maybe Data.Word.Word32),
                                     _PaymentRequest'pkiType :: !(Prelude.Maybe Data.Text.Text),
                                     _PaymentRequest'pkiData ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _PaymentRequest'serializedPaymentDetails ::
                                     !Data.ByteString.ByteString,
                                     _PaymentRequest'signature ::
                                     !(Prelude.Maybe Data.ByteString.ByteString)}
                    deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "paymentDetailsVersion" PaymentRequest =
     Data.Word.Word32

instance Data.ProtoLens.HasField "paymentDetailsVersion"
         PaymentRequest PaymentRequest where
        field _
          = (Prelude..) maybe'paymentDetailsVersion
              (Data.ProtoLens.maybeLens 1)

type instance
     Data.ProtoLens.Field "maybe'paymentDetailsVersion" PaymentRequest =
     Prelude.Maybe Data.Word.Word32

instance Data.ProtoLens.HasField "maybe'paymentDetailsVersion"
         PaymentRequest PaymentRequest where
        field _
          = Lens.Family2.Unchecked.lens _PaymentRequest'paymentDetailsVersion
              (\ x__ y__ -> x__{_PaymentRequest'paymentDetailsVersion = y__})

type instance Data.ProtoLens.Field "pkiType" PaymentRequest =
     Data.Text.Text

instance Data.ProtoLens.HasField "pkiType" PaymentRequest
         PaymentRequest where
        field _
          = (Prelude..) maybe'pkiType
              (Data.ProtoLens.maybeLens (Data.Text.pack "none"))

type instance Data.ProtoLens.Field "maybe'pkiType" PaymentRequest =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'pkiType" PaymentRequest
         PaymentRequest where
        field _
          = Lens.Family2.Unchecked.lens _PaymentRequest'pkiType
              (\ x__ y__ -> x__{_PaymentRequest'pkiType = y__})

type instance Data.ProtoLens.Field "pkiData" PaymentRequest =
     Data.ByteString.ByteString

instance Data.ProtoLens.HasField "pkiData" PaymentRequest
         PaymentRequest where
        field _
          = (Prelude..) maybe'pkiData
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'pkiData" PaymentRequest =
     Prelude.Maybe Data.ByteString.ByteString

instance Data.ProtoLens.HasField "maybe'pkiData" PaymentRequest
         PaymentRequest where
        field _
          = Lens.Family2.Unchecked.lens _PaymentRequest'pkiData
              (\ x__ y__ -> x__{_PaymentRequest'pkiData = y__})

type instance
     Data.ProtoLens.Field "serializedPaymentDetails" PaymentRequest =
     Data.ByteString.ByteString

instance Data.ProtoLens.HasField "serializedPaymentDetails"
         PaymentRequest PaymentRequest where
        field _
          = Lens.Family2.Unchecked.lens
              _PaymentRequest'serializedPaymentDetails
              (\ x__ y__ -> x__{_PaymentRequest'serializedPaymentDetails = y__})

type instance Data.ProtoLens.Field "signature" PaymentRequest =
     Data.ByteString.ByteString

instance Data.ProtoLens.HasField "signature" PaymentRequest
         PaymentRequest where
        field _
          = (Prelude..) maybe'signature
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'signature" PaymentRequest
     = Prelude.Maybe Data.ByteString.ByteString

instance Data.ProtoLens.HasField "maybe'signature" PaymentRequest
         PaymentRequest where
        field _
          = Lens.Family2.Unchecked.lens _PaymentRequest'signature
              (\ x__ y__ -> x__{_PaymentRequest'signature = y__})

instance Data.Default.Class.Default PaymentRequest where
        def
          = PaymentRequest{_PaymentRequest'paymentDetailsVersion =
                             Prelude.Nothing,
                           _PaymentRequest'pkiType = Prelude.Nothing,
                           _PaymentRequest'pkiData = Prelude.Nothing,
                           _PaymentRequest'serializedPaymentDetails =
                             Data.ProtoLens.fieldDefault,
                           _PaymentRequest'signature = Prelude.Nothing}

instance Data.ProtoLens.Message PaymentRequest where
        descriptor
          = let paymentDetailsVersion__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "payment_details_version"
                      (Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField maybe'paymentDetailsVersion)
                pkiType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pki_type"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'pkiType)
                pkiData__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pki_data"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField maybe'pkiData)
                serializedPaymentDetails__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "serialized_payment_details"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         serializedPaymentDetails)
                signature__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "signature"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField maybe'signature)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, paymentDetailsVersion__field_descriptor),
                    (Data.ProtoLens.Tag 2, pkiType__field_descriptor),
                    (Data.ProtoLens.Tag 3, pkiData__field_descriptor),
                    (Data.ProtoLens.Tag 4, serializedPaymentDetails__field_descriptor),
                    (Data.ProtoLens.Tag 5, signature__field_descriptor)])
                (Data.Map.fromList
                   [("payment_details_version",
                     paymentDetailsVersion__field_descriptor),
                    ("pki_type", pkiType__field_descriptor),
                    ("pki_data", pkiData__field_descriptor),
                    ("serialized_payment_details",
                     serializedPaymentDetails__field_descriptor),
                    ("signature", signature__field_descriptor)])

data X509Certificates = X509Certificates{_X509Certificates'certificate
                                         :: ![Data.ByteString.ByteString]}
                      deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "certificate" X509Certificates =
     [Data.ByteString.ByteString]

instance Data.ProtoLens.HasField "certificate" X509Certificates
         X509Certificates where
        field _
          = Lens.Family2.Unchecked.lens _X509Certificates'certificate
              (\ x__ y__ -> x__{_X509Certificates'certificate = y__})

instance Data.Default.Class.Default X509Certificates where
        def = X509Certificates{_X509Certificates'certificate = []}

instance Data.ProtoLens.Message X509Certificates where
        descriptor
          = let certificate__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "certificate"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked certificate)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, certificate__field_descriptor)])
                (Data.Map.fromList
                   [("certificate", certificate__field_descriptor)])

amount ::
       forall msg msg' . Data.ProtoLens.HasField "amount" msg msg' =>
         Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "amount" msg)
           (Data.ProtoLens.Field "amount" msg')
amount
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "amount")

certificate ::
            forall msg msg' . Data.ProtoLens.HasField "certificate" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "certificate" msg)
                (Data.ProtoLens.Field "certificate" msg')
certificate
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "certificate")

expires ::
        forall msg msg' . Data.ProtoLens.HasField "expires" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "expires" msg)
            (Data.ProtoLens.Field "expires" msg')
expires
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "expires")

maybe'amount ::
             forall msg msg' .
               Data.ProtoLens.HasField "maybe'amount" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "maybe'amount" msg)
                 (Data.ProtoLens.Field "maybe'amount" msg')
maybe'amount
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'amount")

maybe'expires ::
              forall msg msg' .
                Data.ProtoLens.HasField "maybe'expires" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "maybe'expires" msg)
                  (Data.ProtoLens.Field "maybe'expires" msg')
maybe'expires
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'expires")

maybe'memo ::
           forall msg msg' . Data.ProtoLens.HasField "maybe'memo" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'memo" msg)
               (Data.ProtoLens.Field "maybe'memo" msg')
maybe'memo
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'memo")

maybe'merchantData ::
                   forall msg msg' .
                     Data.ProtoLens.HasField "maybe'merchantData" msg msg' =>
                     Lens.Family2.Lens msg msg'
                       (Data.ProtoLens.Field "maybe'merchantData" msg)
                       (Data.ProtoLens.Field "maybe'merchantData" msg')
maybe'merchantData
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'merchantData")

maybe'network ::
              forall msg msg' .
                Data.ProtoLens.HasField "maybe'network" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "maybe'network" msg)
                  (Data.ProtoLens.Field "maybe'network" msg')
maybe'network
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'network")

maybe'paymentDetailsVersion ::
                            forall msg msg' .
                              Data.ProtoLens.HasField "maybe'paymentDetailsVersion" msg msg' =>
                              Lens.Family2.Lens msg msg'
                                (Data.ProtoLens.Field "maybe'paymentDetailsVersion" msg)
                                (Data.ProtoLens.Field "maybe'paymentDetailsVersion" msg')
maybe'paymentDetailsVersion
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'paymentDetailsVersion")

maybe'paymentUrl ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "maybe'paymentUrl" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "maybe'paymentUrl" msg)
                     (Data.ProtoLens.Field "maybe'paymentUrl" msg')
maybe'paymentUrl
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'paymentUrl")

maybe'pkiData ::
              forall msg msg' .
                Data.ProtoLens.HasField "maybe'pkiData" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "maybe'pkiData" msg)
                  (Data.ProtoLens.Field "maybe'pkiData" msg')
maybe'pkiData
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'pkiData")

maybe'pkiType ::
              forall msg msg' .
                Data.ProtoLens.HasField "maybe'pkiType" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "maybe'pkiType" msg)
                  (Data.ProtoLens.Field "maybe'pkiType" msg')
maybe'pkiType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'pkiType")

maybe'signature ::
                forall msg msg' .
                  Data.ProtoLens.HasField "maybe'signature" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "maybe'signature" msg)
                    (Data.ProtoLens.Field "maybe'signature" msg')
maybe'signature
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'signature")

memo ::
     forall msg msg' . Data.ProtoLens.HasField "memo" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "memo" msg)
         (Data.ProtoLens.Field "memo" msg')
memo
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "memo")

merchantData ::
             forall msg msg' .
               Data.ProtoLens.HasField "merchantData" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "merchantData" msg)
                 (Data.ProtoLens.Field "merchantData" msg')
merchantData
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "merchantData")

network ::
        forall msg msg' . Data.ProtoLens.HasField "network" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "network" msg)
            (Data.ProtoLens.Field "network" msg')
network
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "network")

outputs ::
        forall msg msg' . Data.ProtoLens.HasField "outputs" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "outputs" msg)
            (Data.ProtoLens.Field "outputs" msg')
outputs
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "outputs")

payment ::
        forall msg msg' . Data.ProtoLens.HasField "payment" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "payment" msg)
            (Data.ProtoLens.Field "payment" msg')
payment
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "payment")

paymentDetailsVersion ::
                      forall msg msg' .
                        Data.ProtoLens.HasField "paymentDetailsVersion" msg msg' =>
                        Lens.Family2.Lens msg msg'
                          (Data.ProtoLens.Field "paymentDetailsVersion" msg)
                          (Data.ProtoLens.Field "paymentDetailsVersion" msg')
paymentDetailsVersion
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "paymentDetailsVersion")

paymentUrl ::
           forall msg msg' . Data.ProtoLens.HasField "paymentUrl" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "paymentUrl" msg)
               (Data.ProtoLens.Field "paymentUrl" msg')
paymentUrl
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "paymentUrl")

pkiData ::
        forall msg msg' . Data.ProtoLens.HasField "pkiData" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "pkiData" msg)
            (Data.ProtoLens.Field "pkiData" msg')
pkiData
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "pkiData")

pkiType ::
        forall msg msg' . Data.ProtoLens.HasField "pkiType" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "pkiType" msg)
            (Data.ProtoLens.Field "pkiType" msg')
pkiType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "pkiType")

refundTo ::
         forall msg msg' . Data.ProtoLens.HasField "refundTo" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "refundTo" msg)
             (Data.ProtoLens.Field "refundTo" msg')
refundTo
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "refundTo")

script ::
       forall msg msg' . Data.ProtoLens.HasField "script" msg msg' =>
         Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "script" msg)
           (Data.ProtoLens.Field "script" msg')
script
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "script")

serializedPaymentDetails ::
                         forall msg msg' .
                           Data.ProtoLens.HasField "serializedPaymentDetails" msg msg' =>
                           Lens.Family2.Lens msg msg'
                             (Data.ProtoLens.Field "serializedPaymentDetails" msg)
                             (Data.ProtoLens.Field "serializedPaymentDetails" msg')
serializedPaymentDetails
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "serializedPaymentDetails")

signature ::
          forall msg msg' . Data.ProtoLens.HasField "signature" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "signature" msg)
              (Data.ProtoLens.Field "signature" msg')
signature
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "signature")

time ::
     forall msg msg' . Data.ProtoLens.HasField "time" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "time" msg)
         (Data.ProtoLens.Field "time" msg')
time
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "time")

transactions ::
             forall msg msg' .
               Data.ProtoLens.HasField "transactions" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "transactions" msg)
                 (Data.ProtoLens.Field "transactions" msg')
transactions
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "transactions")