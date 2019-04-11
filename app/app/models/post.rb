class Post < ApplicationRecord
	belongs_to :user
	has_many :innapropriate_posts
	has_many :abusive_contents
	has_many :comments

	validates :title, length: { in: 0..20 , message: "Title should not greater than 20"}
	validates :description, length: { minimum: 40 , message: "Description should not have less than 40 letters"}

	validates :post_to_dumpster

	def post_to_dumpster 
		if state == false
			
			Dumpster.create(post_id: id)
		end
		
	end
end
