class Comment < ApplicationRecord
  belongs_to :post

  validates :post_in_dumpster

  def post_in_dumpster
  	for i in dumpster.all do 

  		if i.post == post
  			errors.add(:post_id, "The post you are trying to comment is in the dumpster")
  		end

  	end
  	
  end
end
