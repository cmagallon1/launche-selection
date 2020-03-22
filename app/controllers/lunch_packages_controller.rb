class LunchPackagesController < ApplicationController
  before_action :authorized

  def show
    @packages = LunchPackage.where(user_id: params[:user_id]).order(month: :desc).group_by(&:month)
    @packages = @packages.map { |key, value| { "#{key}":value.group_by(&:year) } }
  end

  def new
  end

  def create
    date = params[:lunch_package][:date] || params[:date]
    user = current_user
    meals = package_params[:meals]
    @package = LunchPackagesService.build_package(date, user, meals)
    if @package 
      UserMailer.with(user: user).new_package.deliver_now
      redirect_to meals_path
    else 
      param_error('You have inserted an invalid package') 
    end
  rescue Exception
    param_error('You did not fill all the fields', 'new')
  end

  def edit
    @meals = Meal.all
    @package = LunchPackage.last_month_meals(params[:user_id])
  end

  def update
    @meals = Meal.all
    meals = package_params[:meals]
    @package = LunchPackagesService.update_package(meals, current_user)
    if @package 
      redirect_to users_path
    else 
      param_error('You have inserted an invalid package') 
    end
  rescue Exception
    @package = LunchPackage.last_month_meals(params[:user_id])
    param_error('You did not fill all the fields', 'edit')
  end

  private

  def package_params
    params.require(:lunch_package).permit(:users, date: {}, meals: [])
  end

  def param_error(message, view)
    flash.now[:error] = message 
    render view
  end
end
