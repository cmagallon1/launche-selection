class UsersController < ApplicationController
  before_action :authorized

  def index
    @users = User.all
  end
end
