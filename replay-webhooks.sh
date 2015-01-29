# Testing to see if you can replay webhooks while on the Small Business $129/month plan,
# since replaying via the UI is only available starting at Small Business Plus $169/month.

# https://docs.chargify.com/api-webhooks

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @webhook-ids.json https://$CHARGIFY_SUBDOMAIN.chargify.com/webhooks/replay.json

# Yes, it works fine.  API features are not restricted based on the plan you are paying for.