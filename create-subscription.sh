
#export CHARGIFY_SUBDOMAIN=wsmoak-eur-test
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-blank-vat.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-test.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-invalid-coupon.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
# {"errors":["Coupon Code: is invalid"]}

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-invalid-ref.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
# no error - subscription created

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-coupon-and-ref.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-lowercase-coupon.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
# works fine with lowercase coupon code in v1 api

#curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-bad-product-id.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-bad-product-handle.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
