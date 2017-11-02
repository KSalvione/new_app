class PaymentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@user = current_user#PROBLEM HERE???

		token = params[:stripeToken]
		#Create the charge on Stripe servers, this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				amount: (@product.price*100).to_i,
				currency: "usd",
				source: token,
				description: params[:stripeEmail],
				receipt_email: params[:stripeEmail]
			)

			if charge.paid
				Order.create(product_id: @product.id, user_id: @user_id, total: @product.price )
				flash[:success] = "Your payment was successful"
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
