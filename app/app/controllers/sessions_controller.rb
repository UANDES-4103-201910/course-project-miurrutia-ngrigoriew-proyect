class SessionsController < ApplicationController
  def new

  end

  def create

    user = User.find_by(email: params[:session][:email])
  	par = params[:session][:password]
  	
  	if user && user[:password] == par
      if user[:email] == 'admin@miuandes.cl'
        cookies[:log_in]=user
        log_in user
        redirect_to 'http://localhost:3000/homea/index'
        flash[:notice] = 'Logged in successfully'
      
      elsif user[:email] == 'sadmin@miuandes.cl'
        cookies[:log_in]=user
        log_in user
        redirect_to 'http://localhost:3000/homesa/index'
        flash[:notice] = 'Logged in successfully'
      else

    		cookies[:log_in]=user
    		log_in user
      	redirect_to 'http://localhost:3000/home2/index'
      	flash[:notice]='Logged in successfully'
      end
  	else
    		flash.now[:error] = 'Invalid email/password combination'
    		render :new
  	end
  end

  def destroy
  	log_out
    redirect_to root_url

  end
end
