require 'rails_helper'

describe Comment do
	
	context "empty comment" do

		it "is not valid without a comment" do
			expect(Comment.new(body: "")).not_to be_valid
		end
		
	end
end