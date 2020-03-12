class LaunchPackagesController < ApplicationController
  def index
    @packages = LaunchPackage.order(:month, :desc)
  end

  def new
    @package = LaunchPackage.new
  end

  def create
    user = User.find(package_params[:users])
    month = params[:launch_package][:month] ? params[:launch_package][:month] : params[:month].to_i
    @package = build_package(month, user)
    redirect_user(@package) 
  end

  private

  def redirect_user(package)
    if package
      redirect_to meals_path
    else 
      render 'new'
    end
  end

  def build_package(month, user)
    meals = package_params[:meals]
    res = valid_package?(user, meals, params[:month])
    res ? save_package(meals, user, month) : res
  end

  def save_package(meals, user, month)
    data = meals.map { |meal| { meal_id: meal.to_i, month: month } }
    user.launch_packages.create(data)
  end

  def package_params
    params.require(:launch_package).permit(:users, :month ,meals: [])
  end

  def valid_package?(user, meals, month)
    user = User.find(package_params[:users])
    meals.count == 5 && !user_packages(user).include?(month_name(month.to_i))
  end

  def month_name(month_index)
    LaunchPackage.months.key(month_index)
  end

  def user_packages(user)
    LaunchPackage.where(user_id: user).pluck(:month)
  end
end
