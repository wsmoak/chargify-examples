# Testing creating a component with fractional quantity allowed
# https://docs.chargify.com/api-components

export PRODUCT_FAMILY_ID=460852

curl --verbose -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST \
-d @create-component.json https://$CHARGIFY_SUBDOMAIN.chargify.com/product_families/$PRODUCT_FAMILY_ID/metered_components.json
