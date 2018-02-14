require 'rails_helper'

describe Comment do
	
	context "empty comment" do

		it "is not valid without a comment" do
			expect(Comment.new(body: "")).not_to be_valid
		end

		it "is not valid without a user" do
			expect(Comment.new(body: "great", product: @product, rating: @rating)).not_to be_valid
		end

		it "is not valid without a product" do
			expect(Comment.new(body: "great", user: @user, rating: @rating)).not_to be_valid
		end

		it "is not valid without a rating" do
			expect(Comment.new(body: "great", user: @user, product: @product)).not_to be_valid
		end

	end
end