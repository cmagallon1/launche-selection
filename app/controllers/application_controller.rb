class ApplicationController < ActionController::Base
  before_action :authorized 
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized
    redirect_to '/' unless current_user
  end
end
