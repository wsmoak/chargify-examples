require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# Retrieve a list of all your subscriptions
subscription = Chargify::Subscription.find(7570777)

#puts subscription.inspect

puts subscription.product.handle

subscription.product.handle = "annual-plan"

puts subscription.product.handle

subscription.save

