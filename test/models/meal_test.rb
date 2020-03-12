require 'test_helper'

class MealTest < ActiveSupport::TestCase

  def test_save_meal
    assert create(:meal)
  end

  def test_save_meal_without_params
    meal = Meal.new
    assert_not meal.save
  end

  def test_meal_is_related_with_users
    create(:user)
    create(:meal)
    create(:launch_package)
    assert Meal.all.sample.users
  end
end
