require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  def test_redirect_to_new_meal
    get new_meals_url
    assert_response :success
  end

  def test_create_new_meal
    assert_difference("Meal.count") do
      post meals, params: { meal: attributes_for(:meal) }
      assert_response :success
    end
  end
end

