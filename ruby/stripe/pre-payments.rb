# Pre-payments with Chargify and Stripe

require "stripe"
require "chargify_api_ares"

Stripe.api_key = ENV['STRIPE_SECRET_KEY']

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

# Find a Chargify Subscription
sub = Chargify::Subscription.find 11335477

puts sub.inspect

# Create a Charge directly at Stripe
chg = Stripe::Charge.create(
  :amount      => 2500,
  :description => 'Pre-payment for...',
  :currency    => 'usd',
  :customer    => sub.payment_profile.vault_token
)

puts chg.inspect

# You may want to store the `id` of the charge in your database,
# or add a note / metadata to the subscription, so that you can
# tie the transactions together if there is a question later.

# Record an external payment on the Chargify Subscription
if chg.paid
  pmt = sub.payment(
    amount_in_cents: 2500,
    memo: "Pre-payment for..."
  )
else
  puts "Charge at Stripe was NOT successful"
end

puts pmt.inspect
