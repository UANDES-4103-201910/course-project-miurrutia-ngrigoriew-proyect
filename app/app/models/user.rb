class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable , :omniauth_providers => [:google_oauth2]

  validates :aup, inclusion: { in: [ true] }
  validates :tos, inclusion: { in: [ true] }

	def self.from_omniauth(auth)
		where(provider: auth.provider ,uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.name = auth.info.name
			user.password = Devise.friendly_token[0, 20]
			user.aup = true
			user.terms = true
		end
	end
  acts_as_voter
end
