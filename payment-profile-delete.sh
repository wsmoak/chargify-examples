# Testing Delete a Payment Profile

echo "Create a subscription with a payment profile"
SUBSCRIPTION_ID=$(curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-test.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json | jq '.subscription.id')

echo "Get the payment profile ID"
PAYMENT_PROFILE_ID=$(curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID.json | jq '.subscription.credit_card.id')

echo "Delete the payment profile from the subscription"
curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X DELETE https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/payment_profiles/$PAYMENT_PROFILE_ID.json

echo "Retrieve the payment profile by ID"
curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/payment_profiles/$PAYMENT_PROFILE_ID.json

# Should be 404 / no response body
