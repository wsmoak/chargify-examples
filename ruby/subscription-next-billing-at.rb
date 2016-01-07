gem 'chargify_api_ares', '=1.4.3'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

sub = Chargify::Subscription.find 11335495

sub.next_billing_at = "2016-12-01"

sub.save

puts sub.inspect

