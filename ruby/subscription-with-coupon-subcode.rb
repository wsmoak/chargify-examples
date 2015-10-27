# Testing using a coupon subcode when creating a subscription

gem 'chargify_api_ares', '=1.3.5'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

subscription = Chargify::Subscription.create(
  product_handle: 'monthly-plan',
  coupon_code: "SUBCODE1",
  customer_attributes: {
    first_name: "Test354",
    last_name: "Customer1027",
    email: "test@example.com"
  },
  credit_card_attributes: {
    card_number: 4242424242424242,
    cvv: 123,
    expiration_month: 3,
    expiration_year: 2020
  }
)

puts subscription.inspect

