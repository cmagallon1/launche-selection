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
    meal = build(:meal, image: nil)
    assert_not meal.valid?
  end

  def test_save_meal_without_params
    meal = Meal.new
    assert_not meal.valid?
  end

  def test_update_meal
    user = create(:user)
    meal = create(:meal)
    assert meal.update({ 
      name: Faker::Name.name, 
      image: fixture_file_upload("#{Rails.root}/test/fixtures/files/test.png", 'image/png'), 
      user_id: user.id 
    })
  end
end
