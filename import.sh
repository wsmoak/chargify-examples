#Example of importing a subscription, including components
# https://docs.chargify.com/api-subscriptions#full-example

curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST \
-d @import.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
