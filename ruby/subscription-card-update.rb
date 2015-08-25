
gem 'chargify_api_ares', '=1.3.5'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

sub = Chargify::Subscription.find 9970657

sub.credit_card_attributes = {:full_number => "3", :expiration_year => "2020"}

sub.save

puts sub.inspect

