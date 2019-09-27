# Create a subscription with a PayPal nonce

# For example nonce values, see
# https://developers.braintreepayments.com/reference/general/testing/ruby#nonces-representing-alternative-payment-methods

export CHARGIFY_SUBDOMAIN=wsmoak-braintree

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-with-paypal-nonce.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

