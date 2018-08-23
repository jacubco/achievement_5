if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_FgBgX4GQmt41cmh1Oy7FLwQv',
    secret_key: 'sk_test_J85PXu1tSWEBBu6XnK5hsM4J'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]