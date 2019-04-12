class InnapropriateContent < ApplicationRecord
  belongs_to :post

  validates :post, presence: true

end

