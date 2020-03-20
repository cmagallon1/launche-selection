class LunchPackagesController < ApplicationController
  def index
    @packages = LunchPackage.monthly_lunches.group_by(&:month)
  end

  def new
    @package = LunchPackage.new
  end

  def create
    user = User.find(package_params[:users])
    date = params[:lunch_package][:date] || params[:date]
    @package = LunchPackagesService.new.build_package(date, user, package_params[:meals])
    redirect_user(@package) 
  end

  def edit
  end

  def update
    @package = LunchPackagesService.new.update_package(params[:meals], current_user)
    if @package 
      redirect_to meals_path
    else 
      render 'edit'
    end
  end

  private

  def redirect_user(package)
    if package
      redirect_to meals_path
    else 
      redirect_to new_lunch_package_path
    end
  end

   def package_params
    params.require(:lunch_package).permit(:users, date: {}, meals: [])
  end
end
