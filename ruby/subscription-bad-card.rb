
gem 'chargify_api_ares', '=1.3.4'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

subscription = Chargify::Subscription.create(
  product_handle: 'test-product-a',
  customer_attributes: {
    first_name: "Test159",
    last_name: "Customer825",
    email: "test159825@example.com"
  },
  credit_card_attributes: {
    first_name: "Test159",
    last_name: "Customer825",
    card_number: "3",
    cvv: "123",
    expiration_month: "8",
    expiration_year: "2020"
  }
)

subscription.save

# With a card number of 3, the save results in an error:
# /Users/wsmoak/.rbenv/versions/2.1.6/lib/ruby/gems/2.1.0/gems/activeresource-4.0.0/lib/active_resource/validations.rb:19:in `block (2 levels) in from_array': undefined method `[]' for nil:NilClass (NoMethodError)

puts subscription.inspect

