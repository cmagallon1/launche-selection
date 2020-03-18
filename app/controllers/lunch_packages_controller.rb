class LunchPackagesController < ApplicationController
  def index
    @packages = LunchPackage.order(month: :desc, year: :desc)
  end

  def new
    @package = LunchPackage.new
  end

  def create
    user = User.find(package_params[:users])
    date = params[:lunch_package][:date] ? params[:lunch_package][:date] : params[:date]
    @package = build_package(date, user)
    redirect_user(@package) 
  end

  def edit
  end

  def update
    if valid_package_update(params[:meals])
      @meals = LunchPackage.where(user_id: params[:id], month: Date::MONTHNAMES[Date.today.month])
      @meals.each_with_index do |meal, i|
        @package = meal.update(meal_id: params[:meals][i])
        break unless @package
      end
      if @package 
        redirect_to meals_path
      else 
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  private

  def valid_package_update(meals)
    if meals
      (meals.count == 5)
    end
  end

  def redirect_user(package)
    if package
      redirect_to meals_path
    else 
      redirect_to new_lunch_package_path
    end
  end

  def build_package(date, user)
    meals = package_params[:meals]
    res = valid_package?(user, meals, date)
    res ? save_package(meals, user, date) : res
  end

  def save_package(meals, user, date)
    data = meals.map { |meal| { meal_id: meal.to_i, month: date[:month].to_i, year: date[:year] } }
    user.lunch_packages.create(data)
  end

  def package_params
    params.require(:lunch_package).permit(:users, date: {}, meals: [])
  end

  def valid_package?(user, meals, date)
    user = User.find(package_params[:users])
    if meals
      meals.count == 5 && !already_package?(user, date)
    end
  end

  def month_name(month_index)
    LunchPackage.months.key(month_index)
  end

  def already_package?(user, date)
    is_already = false
    user_packages(user).each { |package| is_already = true if package.include?(month_name(date[:month].to_i)) && package.include?(date[:year]) } 
    is_already 
  end

  def user_packages(user)
    LunchPackage.where(user_id: user).pluck(:month, :year)
  end
end
