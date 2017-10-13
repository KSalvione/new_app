require 'rails_helper'

describe User do
	context "Validating users" do

		it "is not valid without a password" do
			expect(User.new(password: "")).not_to be_valid
		end

	end
	
end