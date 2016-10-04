# Testing creating a subscription with metadata (custom fields)

gem 'chargify_api_ares', '=1.4.7'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

subscription = Chargify::Subscription.create(
  product_handle: 'monthly-plan',
  customer_attributes: {
    first_name: "Test807",
    last_name: "Customer1004",
    email: "test8071004@example.com"
  },
  credit_card_attributes: {
    card_number: 4242424242424242,
    cvv: 123,
    expiration_month: 3,
    expiration_year: 2020
  },
  metafields: {
    color: "blue",
    size: "large"
  }
)

puts subscription.inspect
