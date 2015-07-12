curl -u $CHARGIFY_DIRECT_API_ID:$CHARGIFY_DIRECT_PASSWORD -H Accept:application/json -H Content-Type:application/json -X POST -d @signup-apiv2-with-uniqueness-token.json https://api.chargify.com/api/v2/signups

curl -u $CHARGIFY_DIRECT_API_ID:$CHARGIFY_DIRECT_PASSWORD -H Accept:application/json -H Content-Type:application/json -X POST -d @signup-apiv2.json https://api.chargify.com/api/v2/signups

#curl -u $CHARGIFY_DIRECT_API_ID:$CHARGIFY_DIRECT_PASSWORD -H Accept:application/json -H Content-Type:application/json -X POST -d @signup-apiv2-with-lowercase-coupon-code.json https://api.chargify.com/api/v2/signups
# works fine with lowercase coupon code
