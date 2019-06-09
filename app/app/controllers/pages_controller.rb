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
  def search1

      if params[:search1].blank?  
        redirect_to(root_path, alert: "Empty field!") and return

      else  
          @posttitles = Post.all.where("lower(title) LIKE (?)", "%#{params[:search1]}%")
      end

 
  end

    def search2

      if params[:search2].blank?  
        redirect_to(root_path, alert: "Empty field!") and return

      else  
          @results = User.all.where("lower(name) LIKE (?)", "%#{params[:search2]}%") 
      end

 
  end

end
