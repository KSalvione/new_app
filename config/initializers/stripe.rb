if Rails.env.production?#conditional checking if app is running in production env
	Rails.configuration.stripe = {
		publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
		secret_key: ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		publishable_key: 'pk_test_1zM9dM7XGNoD4EmvOQ7cuDNC',
		secret_key: 'sk_test_HPTQO9pkqWhGaVTtm586P1lR'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]