class User < ApplicationRecord
	has_one :user_profile
	has_many :posts
	has_many :comments
	has_many :innapropriate_contents
	has_many :abusive_contents

	validates :password , length: { in: 9..12}, format: {with: /[A-Za-z0-9]/}
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP ,message: "Invalid Email"}
	validates :name, presence: true
	validates :lastname, presence: true
end
