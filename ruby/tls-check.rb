require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = "tlscheck"
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

subscription = Chargify::Subscription.find(123)

# => [...]lib/active_support/xml_mini/rexml.rb:35:in `parse': The document "ConnectionOK\n" does not have a valid root (REXML::ParseException)

# The error confirms that it has successfully connected to https://tlscheck.chargify.com/ and received the "ConnectionOK" text indicating that all is well.
