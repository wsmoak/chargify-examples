
#export CHARGIFY_SUBDOMAIN=wsmoak-eur-test
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-blank-vat.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-test.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-invalid-coupon.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
# {"errors":["Coupon Code: is invalid"]}

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-invalid-ref.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
# was: no error - subscription created
# as of 2015-09-23: error Referral code is invalid.


#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-coupon-and-ref.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-lowercase-coupon.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
# works fine with lowercase coupon code in v1 api

#curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-bad-product-id.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-bad-product-handle.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json

#curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-subscription-with-metadata.json https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json
# result: metadata is included as of 2015-10-15

curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/xml -H Content-Type:application/xml -X POST -d @create-subscription-with-metadata.xml https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.xml


#curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @$1 https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions.json | python -m json.tool

