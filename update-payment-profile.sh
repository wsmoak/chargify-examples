# Testing Payment Profile Update
# & Re-try for Past Due Subscription

# http://developer.authorize.net/tools/errorgenerationguide/
# Zip Code 46282 will result in a decline

# https://docs.chargify.com/api-payment-profiles
# https://docs.chargify.com/api-subscriptions

export CHARGIFY_SUBDOMAIN=wsmoak-authorizenet
export SUBSCRIPTION_ID=10066418
export PAYMENT_PROFILE_ID=6652664

# Testing partial card update with Authorize.NET

#curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -d @update-payment-profile-partial.json -X PUT https://$CHARGIFY_SUBDOMAIN.chargify.com/payment_profiles/$PAYMENT_PROFILE_ID.json

# Now attempt to retry the subscription

curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X PUT https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/retry.json

#curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/xml -H Content-Type:application/xml -X PUT https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/retry.xml
