# Create a subscription with a PayPal vault token

export CHARGIFY_SUBDOMAIN=wsmoak-braintree

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-with-paypal-vault-token.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

