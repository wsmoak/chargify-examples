
gem 'chargify_api_ares', '=1.3.4'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

SUBSCRIPTION_ID = 9145129
COMPONENT_ID = 79453

subscription = Chargify::Subscription.find( subscription_id )
component = subscription.component( component_id )
component.allocated_quantity = 4
component.save

# Note: this uses the Components API which does NOT prorate
