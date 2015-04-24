# https://docs.chargify.com/api-metafields

curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @customer-metafields.json https://$CHARGIFY_SUBDOMAIN.chargify.com/customers/metafields.json
