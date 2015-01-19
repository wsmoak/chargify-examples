# Testing the statement api to see if it includes the component allocations
# (No, it only includes the summary '125 widgets' not each individual allocation)
# https://docs.chargify.com/api-statements

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/statements/45316565.json

