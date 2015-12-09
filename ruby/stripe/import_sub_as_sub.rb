# Importing Stripe Customers and Subscriptions
# to Chargify as Customers and Subscriptions

require "stripe"
require 'chargify_api_ares'

Stripe.api_key = ENV['STRIPE_SECRET_KEY']

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

customers = Stripe::Customer.all(:limit => 1)

customers.each { |cust|
  puts cust

  #TODO: decide how to split 'description' into first/last name

  newcust = Chargify::Customer.create(
    :first_name   => cust.description,
    :last_name    => cust.description,
    :email        => cust.email
  )
  puts newcust.inspect
  customer_id = newcust.id

  # first subscription, using cust.id as the vault token for the payment profile

  card = cust.sources.data[0]
  sub1 = cust.subscriptions.data[0]

  newsub1 = Chargify::Subscription.create(
    :customer_id => customer_id,
    :product_handle => 'basic', # infer from the stripe plan id?
    :next_billing_at => Time.at(sub1.current_period_end).to_datetime,
    :credit_card_attributes => {
      :vault_token => cust.id,
      :current_vault => 'stripe',
      :expiration_month => card.exp_month,
      :expiration_year => card.exp_year,
      :last_four => card.last4,
      :card_type => card.brand.downcase,
      :first_name => cust.description,
      :last_name => cust.description
    }
  )
  puts newsub1.inspect

  payment_profile_id = newsub1.credit_card.id

  # subsequent subscription creations for this customer will use
  # the existing customer id and payment profile id

  sub2 = cust.subscriptions.data[1]

  newsub2 = Chargify::Subscription.create(
    :customer_id => customer_id,
    :payment_profile_id => payment_profile_id,
    :product_handle => 'pro',
    :next_billing_at => Time.at(sub2.current_period_end).to_datetime
  )
}

# References
# http://stackoverflow.com/questions/7816365/how-to-convert-a-unix-timestamp-seconds-since-epoch-to-ruby-datetime
# https://github.com/chargify/chargify_api_ares/blob/fb5829412a7f8d15464b1d5a296cf496006e49c5/spec/remote/remote_spec.rb
# https://docs.chargify.com/api-subscriptions
