# Testing referral code in chargify_api_ares gem

gem 'chargify_api_ares', '=1.3.2'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# Create a  subscription
new_sub = Chargify::Subscription.create(
  :product_handle => 'free-product-with-trial-period',
  :customer_attributes => {
    :reference => "Test899",
    :first_name => "Test899",
    :last_name => "Customer899",
    :email => "test@example.com"
  },
  :components=>[{:component_id=>76623, :allocated_quantity=>7}],
  :ref => "jj9pvw"
)

puts new_sub.id