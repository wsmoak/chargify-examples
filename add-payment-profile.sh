# Testing creation of an ACH payment profile on a new customer
# https://docs.chargify.com/api-payment-profiles

curl -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @payment-profile-ach.txt https://acme-test-ach.chargify.com/payment_profiles.json
