# A simple Sinatra app showing how to use Stripe Checkout with Chargify
#
# To start:  `ruby sinatra-checkout.rb` and visit http://localhost:4567
#
# References:
# https://stripe.com/docs/checkout/guides/sinatra
# https://docs.chargify.com/api-subscriptions

require 'sinatra'
require 'stripe'
require 'chargify_api_ares'

Chargify.configure do |c|
  c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
  c.api_key   = ENV['CHARGIFY_API_KEY']
end

set :publishable_key, ENV['STRIPE_PUBLISHABLE_KEY']
set :secret_key, ENV['STRIPE_SECRET_KEY']

Stripe.api_key = settings.secret_key

get '/' do
  erb :index
end

post '/charge' do

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  subscription = Chargify::Subscription.create(
    product_handle: 'monthly-plan',
    customer_attributes: {
      first_name: "Valued",
      last_name: "Customer",
      email: params[:stripeEmail]
    },
    credit_card_attributes: {
      current_vault: 'stripe',
      vault_token: customer.id
    }
  )

  erb :success
end

error Stripe::CardError do
  env['sinatra.error'].message
end

__END__

@@ layout
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <%= yield %>
  </body>
  </html>

@@ index
  <form action="/charge" method="post" class="payment">
    <article>
      <label class="amount">
        <span>$30.00 per month</span>
      </label>
    </article>

    <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
            data-key="<%= settings.publishable_key %>" data-label="Subscribe!">
            </script>
  </form>

@@ success
  <h2>Thanks, you paid <strong>$30.00</strong> today and we'll charge you again next month!</h2>
