class UserMailer < ApplicationMailer
	default from: "kristel.salv@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => 'kristel.salv@gmail.com',
			:subject => "A new contact form message from #{name}")
	end

	def welcome_mail(user)
		@appname="BB Blades"
		mail(to: user.email, subject: "Welcome to #{@appname}!")
	end
end
