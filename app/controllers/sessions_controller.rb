class SessionsController < ApplicationController

  def new 
    @user = User.new
  end

  def create
    user = User.find_by_name(session_params[:name])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to meals_path
    else 
      redirect_to new_session_path
    end
  end

  def destroy
    @current_user = nil
    redirect_to new_session_path
  end

  private
  
  def session_params
    params.require(:user).permit(:name, :password)
  end
end
