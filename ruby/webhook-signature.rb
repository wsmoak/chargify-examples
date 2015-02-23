# https://docs.chargify.com/webhooks -> Webhook Verification

require 'openssl'

site_shared_key = "123"

webhook_body = "payload[chargify]=testing&event=test"

#sig = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha256'), site_shared_key, webhook_body)
# Digest::Digest is deprecated; use Digest

sig = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), site_shared_key, webhook_body)

puts sig

# result is: 19826d51b9f866b26eda1f154de192593360f8d0bcb63df8a28540a5dcf733f1