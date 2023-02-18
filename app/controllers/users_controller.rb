class UsersController < ApplicationController
  before_action :authenticate_with_http_digest
  
  def new
      @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
      @users = User.all
  end

  def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "User created."
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
      @user = current_user   
              
  end
  
  def destroy
      session[:user_id] = nil
      @user = current_user
      User.find(params[:id]).destroy
      flash[:succes] = "User deleted"      
      redirect_to root_path
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to root_path

    else

      render :edit, status: :unprocessable_entity
                 
    end
  end

  private      
  def user_params
      params.require(:user).permit(:username, :email, :password )
  end
  def find_user
      @user = User.find_by(id: params[:id])
  end
end