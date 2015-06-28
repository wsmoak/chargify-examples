# Testing an external refund
# https://docs.chargify.com/api-refunds-external (TODO)

export SUBSCRIPTION_ID=9306224

curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @external-refund.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/refunds.json
