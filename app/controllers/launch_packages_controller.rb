class LaunchPackagesController < ApplicationController
  def new
    @meals = Meal.all
  end

  def create
    user = User.find(package_params[:user_id])
    @package = user.launch_packages.new(meal_id: package_params[:meal_id].to_i)

    if @package.save
      redirect_to meals_path
    else
      render 'new'
    end
  end

  private
  def package_params
    params.require(:package).permit(:user_id, :meal_id)
  end
end
