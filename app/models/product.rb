class Product < ApplicationRecord
	def self.search(search_term)
		like_operator = Rails.env.production? ? "ilike" :"LIKE"
		Product.where("name #{like_operator} ?", "%#{search_term}%")
		has_many :comments
		has_many :orders
	end

	def highest_rating_comment
		Comment.rating_desc.first #capitalized because lowercase C produced an error
	end
end


