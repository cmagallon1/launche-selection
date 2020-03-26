class LunchPackagesController < ApplicationController
  before_action :authorized

  def show
    @packages = LunchPackage.where(user_id: params[:user_id]).order(month: :desc).group_by(&:month)
    @packages = @packages.map { |key, value| { "#{key}":value.group_by(&:year) } }
  end

  def new
    @meals = Meal.all
  end

  def create 
    @meals = Meal.all
    data = package_params.merge!(user: current_user, date: package_params[:date] || params[:date])
    if LunchPackagesService.build_package(data)
      AdminEmailsJob.perform_later(data[:user])
      redirect_to meals_path
    else 
      flash.now[:error] = 'You did not insert a valid package' 
      render 'new'
    end
  rescue Exception
    flash.now[:error] = 'You did not fill all the fields' 
    render 'new'
  end

  def edit
    @meals = Meal.all
    @package = LunchPackage.last_month_meals(params[:user_id] || current_user.id)
    redirect_to meals_path unless @package
  end

  def update
    @meals = Meal.all
    if LunchPackagesService.update_package(package_params.merge(user: current_user))
      redirect_to meals_path
    else 
      flash.now[:error] = 'You did not insert a valid package' 
      render 'edit'
    end
  rescue Exception
    flash.now[:error] = 'You did not fill all the fields'
    render 'edit'
  end

  private

  def package_params
    params.require(:lunch_package).permit(date: {}, meals: [])
  end
end
