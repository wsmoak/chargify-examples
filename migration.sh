# Testing migration preview & creation
# https://docs.chargify.com/api-migrations

export SUBSCRIPTION_ID=7868717

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @migration.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/migrations/preview.json

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @migration.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/migrations.json

curl -u $CHARGIFY_API_KEY:x -H Accept:application/xml -H Content-Type:application/xml -X POST -d @migration.xml https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/migrations.xml
