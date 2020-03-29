class MealsController < ApplicationController
  before_action :find_meal, only: [:show, :edit, :update]
  before_action :validate_user, only: [:edit, :update]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create 
    @meal = Meal.new(meal_params.merge(user_id: current_user.id))
    if @meal.save 
      redirect_to @meal
    else 
      render 'new'
    end
  end

  def update
    if @meal.update(meal_params)
      redirect_to @meal
    else
      render 'edit'
    end
  end

  private 

  def meal_params 
    params.require(:meal).permit(:name, :image)
  end

  def find_meal
    @meal = Meal.find(params[:id])
  end

  def validate_user
    redirect_to meals_path unless current_user.id == @meal.user_id || current_user.admin?
  end
end
