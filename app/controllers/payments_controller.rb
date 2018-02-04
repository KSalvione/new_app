class PaymentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@product = Product.find(params[:product_id])
		@user = current_user#PROBLEM HERE???

		token = params[:stripeToken]
		#Create the charge on Stripe servers, this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				amount: (@product.price).to_i,
				currency: "usd",
				source: token,
				description: params[:stripeEmail],
				receipt_email: params[:stripeEmail]
			)

			if charge.paid
				Order.create!(product: @product, user: @user, total: @product.price )
				UserMailer.receipt_email(@user).deliver_now
				flash[:alert] = "Your payment was successful"
			end

		rescue Stripe::CardError => e
			#The card has been declined
			body = e.json_body
			err = body[:error]
			flash[:error] = "There was an error processing your payment: #{err[:message]}"
		end

		redirect_to product_path(@product)
	end

end
