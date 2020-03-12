require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  def test_redirect_to_new_meal
    get new_meal_url
    assert_response :success
  end

  def test_create_new_meal
    assert_difference("Meal.count") do
      post meals_path, params: { meal: attributes_for(:meal) }
      assert_redirected_to meals_path
    end
  end
end

