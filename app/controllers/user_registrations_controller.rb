class UserRegistrationsController < Devise::RegistrationsController
	def create
		super
		if @user.persisted?
			UserMailer.welcome_mail(@user).deliver_now
			redirect_to sign_in_path
		end
	end

	def edit
	end
end
