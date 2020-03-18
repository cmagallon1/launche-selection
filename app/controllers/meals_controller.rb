class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create 
    @meal = Meal.new(meal_params)
    if @meal.save 
      redirect_to meals_path
    else 
      render 'new'
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if current_user.id == @meal.user_id 
      if @meal.update(meal_params)
        redirect_to @meal
      else
        render 'edit'
      end
    else 
      render 'edit'
    end
  end

  private 
  def meal_params 
    params.require(:meal).permit(:name, :image, :user_id)
  end
end
