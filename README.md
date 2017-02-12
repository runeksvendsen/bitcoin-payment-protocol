## Haskell Bitcoin payment protocol (BIP 70/71) library

Initial commit.

Includes test server that will respond with a test *PaymentRequest*,
and accept a *Payment* to which it will respond with PaymentACK.
Responses include proper `Content-Type` and `Content-Transfer-Encoding` headers.

See <a href=test/Test/Main.hs>test/Test/Main.hs</a>.
