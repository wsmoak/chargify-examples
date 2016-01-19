
gem 'chargify_api_ares', '=1.4.3'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

sub = Chargify::Subscription.find 11335477

sub.credit_card_attributes = {:full_number => "4242424242424242", :expiration_year => "2020"}

sub.save

puts sub.inspect
