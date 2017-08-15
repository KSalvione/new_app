class UserMailer < ApplicationMailer
	default from: 'kristel.salv@gmail.com'

	def contact_form(email, name, mesage)
		@message = message
		mail(:from => email,
			:to => 'kristel.salv@gmail.com',
			:subject => "A new contact form message from #{name}")
	end
end
