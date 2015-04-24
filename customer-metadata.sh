# https://docs.chargify.com/api-metadata

export CUSTOMER_ID=8146234

curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @customer-metadata.json https://$CHARGIFY_SUBDOMAIN.chargify.com/customers/$CUSTOMER_ID/metadata.json

