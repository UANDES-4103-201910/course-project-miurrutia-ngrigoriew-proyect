class BlacklistController < ApplicationController
	def index
		@blacklists = Blacklist.all
	end

	def show

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
		@blacklist = Blacklist.find(params[:id])

		if @blacklist.update(blacklist_params)
			redirect_to @blacklist
		else
			render 'edit'
	end

	def destroy
		Blacklist.find(params[:id]).destroy
	end

	private
		def blacklist_params
			params.require(:blacklist).permit(:user)
		end
end
