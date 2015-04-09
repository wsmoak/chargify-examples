# Testing canceling a delayed product change
# https://docs.chargify.com/api-subscriptions

export SUBSCRIPTION_ID=7570777

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X PUT -d @cancel-delayed-product-change.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID.json

