class UsersController < ApplicationController


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
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
    @user = User.new(user_params)
    if @user.save(user_params)
        flash[:notice] = "Created succesfully"
        redirect_to 'http://localhost:3000/utotal/index'
    else
       flash[:error] = "Something is wrong while validating"
       render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      
      redirect_to 'http://localhost:3000/'
      flash[:notice] = "Updated succesfully"
    else
      flash[:error] = "Something went wrong"
      redirect_to :edit
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
      params.require(:user).permit(:name, :last_name, :email, :password, :city, :password_confirmation, :phone)
    end

end
