# Copyright 2015 Wendy Smoak
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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

page = 1

while true do

  subscriptions = Chargify::Subscription.find( :all, params: { per_page: 5, page: page, state: ["active","trialing"] } )

  puts subscriptions.count
  if subscriptions.count == 0 then break end

  subscriptions.each { |sub|
    curr_next_billing = sub.next_assessment_at
    new_next_billing = Time.new curr_next_billing.year, curr_next_billing.month, curr_next_billing.day, 6, 0, 0, "-05:00"
    sub.next_billing_at = new_next_billing
    puts "id: #{sub.id} curr: #{curr_next_billing} new: #{new_next_billing}"
    #sub.save
  }

  page = page + 1

end