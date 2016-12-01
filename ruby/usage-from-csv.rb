gem 'chargify_api_ares', '=1.4.7'
require 'chargify_api_ares'
require 'csv'

# Record metered usage from CSV file

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

COMPONENT_ID = "73721"

CSV.foreach(File.open('usage-test.csv'),{headers: :first_row}) do |line|

  puts "\nProcessing #{line}"

  sub_id = line[0]
  qty = line[1]

  usage = Chargify::Usage.new
  usage.subscription_id = sub_id
  usage.component_id = COMPONENT_ID
  usage.quantity = qty
  usage.memo = "Minutes for ..."

  begin
    usage.save
  rescue ActiveResource::ResourceNotFound => e
    puts e.message
  end

  if usage.persisted?
    puts "Recorded usage of #{qty} for subscription #{sub_id}"
  else
    puts "Something went wrong " + usage.errors.messages.inspect
  end
end

# References
# https://docs.chargify.com/api-metered-usage
# https://github.com/chargify/chargify_api_ares/blob/master/spec/resources/usage_spec.rb
# http://ruby-doc.org/stdlib-2.1.0/libdoc/csv/rdoc/CSV.html
