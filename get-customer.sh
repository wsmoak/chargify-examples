# read a customer

export CUSTOMER_ID=8146234

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/customers/$CUSTOMER_ID.json | python -m json.tool


curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/customers/$CUSTOMER_ID/metadata.json | python -m json.tool
