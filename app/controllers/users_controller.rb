class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to meals_path
    else
      render 'new'
    end  
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
