require 'csv'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

CSV.foreach(File.open('import-test.csv'),{:headers=>:first_row}) do |line|

  puts "\n\n\nProcessing #{line}\n\n"

  newsub = Chargify::Subscription.create(
    :customer_attributes => {
      :first_name => line[2],
      :last_name => line[3],
      :email => line[1]
      },
    :product_handle => 'basic',
    :next_billing_at => line[4],
    :coupon_code => line[7],
    :credit_card_attributes => {
      :vault_token => line[0],
      :current_vault => 'stripe',
      :expiration_month => line[8],
      :expiration_year => line[9],
      :last_four => line[5],
      :card_type => line[6].downcase,
      :first_name => line[2],
      :last_name => line[3]
    },
    :components => [
      {"component_id" => "142511", "allocated_quantity" => line[10]},
      {"component_id" => "82831", "allocated_quantity" => line[11]}
    ]
  )
  puts newsub.inspect

end

# References
# https://docs.chargify.com/api-subscriptions
# http://ruby-doc.org/stdlib-2.1.0/libdoc/csv/rdoc/CSV.html
