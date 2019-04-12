class Post < ApplicationRecord
	belongs_to :user
	has_many :innapropriate_posts
	has_many :abusive_contents
	has_many :comments

	validates :title, presence: true, length: { in: 0..80 , message: "Title should not greater than 80"}
	validates :description, length: { minimum: 1, message: "can't be blank"}


end
