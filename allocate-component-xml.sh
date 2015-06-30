# Testing a component allocation in xml
# https://docs.chargify.com/api-allocations

export SUBSCRIPTION_ID=8958163
export COMPONENT_ID=83060

curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/xml -H Content-Type:application/xml -X POST \
-d @allocate-component.xml https://$CHARGIFY_SUBDOMAIN.chargify.com/subscriptions/$SUBSCRIPTION_ID/components/$COMPONENT_ID/allocations.xml
