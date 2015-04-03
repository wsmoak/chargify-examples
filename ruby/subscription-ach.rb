require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

subscription = Chargify::Subscription.create(
  :product_handle => 'test-trial-product',
  :customer_attributes => {
    :reference => "abc987",
    :first_name => "Test ACH",
    :last_name => "Customer987",
    :email => "test@example.com"
  },
  :bank_account_attributes => {
    "bank_name"=> "Best Bank",
    "bank_routing_number"=> "021000089",
    "bank_account_number"=> "111111111111",
    "bank_account_type"=> "checking",
    "bank_account_holder_type"=> "personal",
    "payment_type"=> "bank_account"
  }
)

puts subscription.inspect
