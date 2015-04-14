# Testing product change
# https://docs.chargify.com/api-subscriptions

export CUSTOMER_ID=8146234

curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X PUT -d @customer-change.json https://$CHARGIFY_SUBDOMAIN.chargify.com/customers/$CUSTOMER_ID.json

