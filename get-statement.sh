# Testing the statement api to see if it includes the component allocations
# (No, it only includes the summary '125 widgets' not each individual allocation)
# https://docs.chargify.com/api-statements

export STATEMENT_ID=47720532

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/statements/$STATEMENT_ID.json | python -m json.tool

