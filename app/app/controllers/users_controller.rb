class UsersController < ApplicationController


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])

  end
  def show
    @user = User.find(params[:id])
  end
  # POST /users
  # POST /users.json
  def create
    set1= params[:user][:set]
    @user = User.new(user_params)
    if set1==1 && set1==nil
      if @user.save(user_params)
        if set1==nil
          flash[:notice] = "User created succesfully"
          redirect_to 'http://localhost:3000/utotal/index'
        else
          flash[:notice] = "Admin created succesfully"
          redirect_to 'http://localhost:3000/utotal/index'
        end
      else
         flash[:error] = "Something is wrong while validating"
         render 'http://localhost:3000/users/new'
      end
    else
      flash[:error] = "Cannot create user with invalid set"
      render 'http://localhost:3000/users/new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      
      redirect_to 'http://localhost:3000/utotal/index'
      flash[:notice] = "Updated succesfully"
    else
      flash[:error] = "Something went wrong"
      redirect_to 'http://localhost:3000/utotal/index'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Destroyed succesfully"
      redirect_to 'http://localhost:3000/utotal/index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :city, :password_confirmation, :phone , :set)
    end

end
