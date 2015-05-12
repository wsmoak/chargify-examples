# Testing product creation
# https://docs.chargify.com/api-products

export PRODUCT_FAMILY_ID=478630

curl -v -u $CHARGIFY_API_KEY:x -H Accept:application/json -H Content-Type:application/json -X POST -d @create-product.json https://$CHARGIFY_SUBDOMAIN.chargify.com/product_families/$PRODUCT_FAMILY_ID/products.json

