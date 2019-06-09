class Post < ApplicationRecord
	belongs_to :user
	has_many :innapropriate_posts
	has_many :abusive_contents
	has_many :comments, dependent: :destroy
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


	acts_as_votable
	validates :title, presence: true, length: { in: 0..80 , message: "Title should not greater than 80"}
	validates :description, length: { minimum: 1, message: "can't be blank"}
	validates :city , length: { minimum: 1, message: "can't be blank"}
	


end
