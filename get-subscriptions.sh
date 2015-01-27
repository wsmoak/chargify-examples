# Testing the subscriptions api - filtering results
# https://docs.chargify.com/api-subscriptions

# list all subscriptions - no parameters
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/

# list all canceled subscriptions
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/?state=canceled

# list all subscriptions by product id
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/?product=3633722

# list all subscriptions by product handle -- APPEARS TO RETURN ALL SUBSCRIPTIONS
# string probably gets converted to an integer (zero) and param is considered not present
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/?product="zero-dollar-product"

# list all subscriptions by coupon code
# not working for a coupon that is on the subscription but hasn't been applied yet
# not working for a coupon that has 1/1 uses applied either
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/?coupon=ABCDE

#not sure how the date fields work...
#curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X GET https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/?date_field=current_period_ends_at&begin_date=2014-12-31&end_date=2015-01-26

