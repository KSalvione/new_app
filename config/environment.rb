# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#enable ActionMailer to use the sendgrid plugin to send out emails from heroku
ActionMailer::Base.smtp_settings = {
	address: 'smtp.sendgrid.net',
	port: '587',
	authentication: :plain,
	user_name: ENV['app73335515@heroku.com'],
	password: ENV['Tbba9009'],
	domain: 'heroku.com',
	enable_starttls_auto: true
}
