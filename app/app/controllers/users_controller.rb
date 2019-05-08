class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
    @user = User.find(params[:id])

  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)
    s1= params[:user][:status1]
    s2= params[:user][:status2]

    p1= params[:user][:password]
    p2= params[:user][:cpassword]
    if p1 == p2
      if s1 == "1" and s2 =="1"
        if user.save        
          redirect_to 'http://localhost:3000/home/index'
          flash.now[:notice] = "Created succesfully"
        else
          redirect_to 'http://localhost:3000/users/new'
          flash.now[:error] = "Something is wrong while validating"
        end
      else
        
        redirect_to 'http://localhost:3000/users/new'
        flash[:error]='Must accept Terms of Service and Use Policy'
      end
    else
      flash[:error]="Password and Confirm password dont match"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    pa1= current_user[:password]
    pa2= params[:user][:cpassword]

    if pa1==pa2
      if @user.update(user_params)
        flash[:notice] = "Updated succesfully"
        redirect_to 'http://localhost:3000/home2/index'
      else
        flash[:error] = "Something went wrong 2"
        redirect_to edit_user_path(current_user)
      end
    else
        flash[:error] = "Password different from Confirm password"
        redirect_to edit_user_path(current_user)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user = User.find(params[:id])
    if @user.destroy(user_params)
      flash[:notice] = "Destroyed succesfully"
      redirect_to @user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :lastname, :email, :password, :phone)
    end
end
