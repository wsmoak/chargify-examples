# Testing Component Allocation
# https://github.com/chargify/chargify_api_ares/pull/92

gem 'chargify_api_ares', '=1.3.4'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
  #c.format    = :json  # NOTE:  Including this line will produce an Error 500
end

SUBSCRIPTION_ID = 9145129
COMPONENT_ID = 79453

Chargify::Allocation.create(
  :subscription_id => SUBSCRIPTION_ID,
  :component_id => COMPONENT_ID,
  :quantity => 33,
  :proration_upgrade_scheme => "prorate-attempt-capture"
  )
