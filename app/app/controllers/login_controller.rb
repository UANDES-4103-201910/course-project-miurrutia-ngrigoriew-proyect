class LoginController < ApplicationController
  def index
  end

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
	par = params[:session][:password]

	if user && user[:password] == par
		cookies[:log_in]=user
		redirect_to user
		flash[:notice] = 'Logged in'
	else
		flash[:error] = 'Invalid email/password combination'
		render :new
	end
	
	if admin && admin[:password] == par
		cookies[:log_in]=admin
		redirect_to admin
		flash[:notice] = 'Logged in'
	else
		flash[:error] = 'Invalid email/password combination'
		render :new
	end

	if superadmin && superadmin[:password] == par
		cookies[:log_in]=superadmin
		redirect_to superadmin
		flash[:notice] = 'Logged in'
	else
		flash[:error] = 'Invalid email/password combination'
		render :new
	end
  end

  def destroy
  	cookies.delete :log_in
	redirect_to 'http://localhost:3000/'
  end
	
end
