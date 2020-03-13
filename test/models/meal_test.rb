require 'test_helper'

class MealTest < ActiveSupport::TestCase

  def test_save_meal
    assert build(:meal).valid?
  end

  def test_save_meal_without_name
    meal = build(:meal, meal_name: "")
    assert_not meal.valid?
  end

  def test_save_meal_without_name
    meal = build(:meal, image: "")
    assert_not meal.valid?
  end

  def test_save_meal_without_params
    meal = Meal.new
    assert_not meal.valid?
  end
end
