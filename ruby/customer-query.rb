require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# Retrieve a customer

customer = Chargify::Customer.find(8146234)

puts customer.inspect

customer = Chargify::Customer.find(:first, from: "/customers.xml", :params => {:q => "test@example.com", per_page: 1})

puts customer.inspect
