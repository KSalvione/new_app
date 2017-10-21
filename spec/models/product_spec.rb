require 'rails_helper' #gets access to rspec tests config

describe Product do #testing the product model

	context "when the product has comments" do

		#before testing created some comments
		before do
			@product = FactoryGirl.create(:product)
			@user = FactoryGirl.create(:user)
			@product.comments.create!(rating: 1, user: user, body: "Awful bike!")
			@product.comments.create!(rating: 3, user: user, body: "Ok bike!")
			@product.comments.create!(rating: 5, user: user, body: "great bike!")
		end


		# Actual test begins here
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3.0
		end

		#Testing validation
		it "is not valid without a name" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end

	end

end