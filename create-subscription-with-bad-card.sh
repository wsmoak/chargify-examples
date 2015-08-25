export CHARGIFY_SUBDOMAIN=wsmoak-api-test

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/xml -H Content-Type:application/xml -X POST -d @create-subscription-with-bad-card.xml https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.xml

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-with-bad-card.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
