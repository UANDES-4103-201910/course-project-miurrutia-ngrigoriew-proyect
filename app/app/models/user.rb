class User < ApplicationRecord

	validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}, uniqueness: true

	validates :phone, length: {minimum: 9, maximum: 12}, allow_blank: true
  	validates :password, format: {with: /\A[a-zA-Z0-9\.]{8,12}\z/ , message: "password must be between 8 to 12 alphanumeric characters"}

end