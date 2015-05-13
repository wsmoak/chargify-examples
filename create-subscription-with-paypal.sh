# Create a subscription with an existing PayPal payment profile

export CHARGIFY_SUBDOMAIN=wsmoak-braintree

# existing customer id is 8564175
# paypal pmt profile id is 5852433

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-with-paypal.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

