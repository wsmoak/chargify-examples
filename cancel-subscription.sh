# Testing Subscription Cancellation
# https://docs.chargify.com/api-subscriptions

export SUBSCRIPTION_ID=7473993

# Cancel Immediately
#curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X DELETE -d @cancel-now.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID.json

# Cancel at End of Period
#curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X PUT -d @cancel-later.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID.json

# Cancel at End of Period with msg
#curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X PUT -d @cancel-later-with-msg.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID.json

# Un-cancel (and clear msg)
#curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X PUT -d @un-cancel.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID.json
