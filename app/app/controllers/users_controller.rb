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
    p1 = User.find(params[:id]).name
    p2 = User.find(params[:id]).lastname
    p3 = User.find(params[:id]).email
    p4 = User.find(params[:id]).password
    p5 = User.find(params[:id]).phone
    p6 = User.find(params[:id]).set
    p7 = User.find(params[:id]).bl
    if @user.update(user_params)
        if @user.update(bl_params)
          if p1 == @user.name && p2 == @user.lastname && p3 == @user.email && p4 == @user.password && p5 == @user.phone && p6 == @user.set && p7 == @user.bl
            redirect_to atotal_index_path
            flash[:notice] = "Updated succesfully"
          else
            if @user.bl == true

              redirect_to utotal_index_path
              flash[:notice] = "Send to blacklist succesfully"
            else
              redirect_to blacklist_path
              flash[:notice] = "User restored succesfully"
            end
          end
        else
          redirect_to utotal_index_path
          flash[:notice] = "Updated succesfully"
        end

      
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
      params.require(:user).permit(:name, :last_name, :email, :password, :city, :password_confirmation, :phone , :set , :aup, :tos)
    end

    def bl_params
      params.require(:user).permit(:bl)
    end

end
