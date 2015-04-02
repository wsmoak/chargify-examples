require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# Retrieve a customer

customer = Chargify::Customer.find(8146234) 

puts customer.inspect

