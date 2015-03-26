# Billing Time Change (same date) with chargify_api_ares gem

# Sets all billing times to 6:00 AM CDT (UTC -05:00)
# http://www.timeanddate.com/time/zones/cdt
# http://ruby-doc.org/core-2.2.1/Time.html
# https://docs.chargify.com/api-subscriptions

gem 'chargify_api_ares', '=1.3.2'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

subscriptions = Chargify::Subscription.find(:all, params: { per_page: 5, state: "active" } )

puts subscriptions.count

subscriptions.each { |sub| 
  curr_next_billing = sub.next_assessment_at
  new_next_billing = Time.new curr_next_billing.year, curr_next_billing.month, curr_next_billing.day, 6, 0, 0, "-05:00"
  sub.next_billing_at = new_next_billing
  puts "id: #{sub.id} curr: #{curr_next_billing} new: #{new_next_billing}" 
  sub.save
}
