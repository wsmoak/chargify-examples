# Testing changes to chargify_api_ares gem for 
# https://github.com/chargify/chargify_api_ares/issues/106

# Use my locally built preview of the next version
gem 'chargify_api_ares', '=1.3.4.pre'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

begin
  
  subscription = Chargify::Subscription.create(
    :product_handle => 'zero-dollar-product',
    :customer_attributes => {
      :first_name => "Test",
      :last_name => "Customer491937",
      :email => "test@example.com"
    },
    :uniqueness_token => "abc-123-def-456"
  )
  
rescue ActiveResource::ResourceConflict
  
  puts "Duplicate Request, Subscription not created"
  
end

puts subscription.inspect

