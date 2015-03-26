# Testing multiple sites in single app with chargify_api_ares gem

gem 'chargify_api_ares', '=1.3.2'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# Read a  subscription
sub1 = subscription = Chargify::Subscription.find(7570777)
puts sub1.id

# Switch to a different subdomain
# Note that the 'site' attribute needs to be cleared out before setting a new subdomain

Chargify.configure do |c|
  c.site = nil
  c.subdomain = ENV['CHARGIFY_OTHER_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# And read a subscription from the new subdomain

sub2 = subscription = Chargify::Subscription.find(7617516)
puts sub2.id

