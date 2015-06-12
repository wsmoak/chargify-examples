# Testing multiple component allocations to see the payment info in the response
# https://docs.chargify.com/api-allocations

export SUBSCRIPTION_ID=8840095
export COMPONENT_ID=79453

curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @allocate-components.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/allocations.json
