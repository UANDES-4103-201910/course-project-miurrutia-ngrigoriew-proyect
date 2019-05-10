class DumpsterController < ApplicationController
	def index
		@dumpsters = Dumpster.all
	end

	def show

	end

	def new
		@dumpster = Dumpster.new
	end

	def edit

	end

	def create
		@dumpster = Dumpster.new(dumpster_params)
		if @dumpster.save
			redirect_to @dumpster
		else
			render :new
		end
	end

	def update
		@dumpster = Dumpster.find(params[:id])

		if @dumpster.update(dumpster_params)
			redirect_to @dumpster
		else
			render :edit
		end
	end

	def destroy
		Dumpster.find(params[:id]).destroy
	end

	
	def dumpster_params
		params.require(:dumpster).permit(:post)
	end
end