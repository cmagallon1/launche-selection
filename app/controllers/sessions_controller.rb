class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new 
    @user = User.new
  end

  def create
    user = User.find_by_email(session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to meals_path
    else 
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to new_session_path
  end

  private
  
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
