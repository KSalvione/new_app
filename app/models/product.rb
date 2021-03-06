class Product < ApplicationRecord
	validates :name, presence: true
	
	has_many :comments
	has_many :orders
	def self.search(search_term)
		like_operator = Rails.env.production? ? "ilike" :"LIKE"
		Product.where("name #{like_operator} ?", "%#{search_term}%")
	end

	def highest_rating_comment
		comments.rating_desc.first #capitalized because lowercase C produced an error
	end

	def average_rating
		comments.average(:rating).to_f
	end

	def views
		#$redis.get("product:#{id}")
	end

	def viewed!
		#$redis.incr("product:#{}")
	end

end


