class BlacklistController < ApplicationController
	def index
		@blacklists = Blacklist.all
		@users = User.all
	end

	def show
		@users = User.all
	end

	def new
		@blacklist = Blacklist.new
	end

	def edit

	end

	def create
		@blacklist = Blacklist.new(blacklist_params)
		if @blacklist.save
			redirect_to @blacklist
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
	      if @user.update(bl_params)
	        redirect_to blacklist_index_path
	        flash[:notice] = "Restored succesfully"
	      else
	        redirect_to 'http://localhost:3000/atotal/index'
	        flash[:notice] = "Updated succesfully"
	      end
	    else
	      flash[:error] = "Something went wrong"
	      redirect_to 'http://localhost:3000/utotal/index'
	    end
	end

	def destroy
		Blacklist.find(params[:id]).destroy
	end

	private
		def blacklist_params
			params.require(:blacklist).permit(:user)
		end
end
