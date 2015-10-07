# Testing multiple component allocations
# https://docs.chargify.com/api-allocations

export SUBSCRIPTION_ID=10202036

curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @allocate-components.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/allocations.json
