class PagesController < ApplicationController

	def search
		if params[:search].blank?  
    		redirect_to(root_path, alert: "Empty field!") and return  
  		else  
   			@parameter = params[:search].downcase  
    		@results = User.all.where("lower(name) LIKE (?)", "%#{params[:search]}%") 
    		@locations = User.all.where("lower(city) LIKE (?)", "%#{params[:search]}%") 
    		@posttitles = Post.all.where("lower(title) LIKE (?)", "%#{params[:search]}%")
    		@postdescriptions = Post.all.where("lower(description) LIKE (?)", "%#{params[:search]}%")
    		@authors = Post.all.joins(:user).where("lower(name) LIKE (?)", "%#{params[:search]}%")

  		end  
	end
end
