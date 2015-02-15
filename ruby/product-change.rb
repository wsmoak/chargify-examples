# Testing changes to chargify_api_ares gem for 
# https://github.com/chargify/chargify_api_ares/issues/100

# Use my locally built preview of the next version
gem 'chargify_api_ares', '=1.3.2.pre'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# Retrieve a  subscription
subscription = Chargify::Subscription.find(7570777)

#puts subscription.inspect

puts "Before"
puts subscription.product.handle

# Un-comment one of the following four lines:

#subscription.product_change('monthly-plan')

#subscription.product_change('annual-plan')

#subscription.delayed_product_change('monthly-plan')

#subscription.cancel_delayed_product_change

# Re-retrieve the subscription
subscription = Chargify::Subscription.find(7570777)

puts "After"
puts subscription.product.handle
