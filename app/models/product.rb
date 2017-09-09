class Product < ApplicationRecord
	def self.search(search_term)
		like_operator = Rails.env.production? ? "ilike" :"LIKE"
		Product.where("name #{like_operator} ?", "%#{search_term}%")
		has_many :comments
	end

	def highest_rating_comment
		comments.rating_desc.first
	end
end


