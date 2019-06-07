class PagesController < ApplicationController

	def search
		if params[:search].blank?  
    		redirect_to(root_path, alert: "Empty field!") and return  
  		else  
   			@parameter = params[:search].downcase  
    		@results = User.all.where("lower(name) LIKE :search", search: @parameter) 
    		@locations = User.all.where("lower(city) LIKE :search", search: @parameter) 
    		@posttitles = Post.all.where(" lower(title) LIKE (?)", "%#{params[:search]}%")

  		end  
	end
end
