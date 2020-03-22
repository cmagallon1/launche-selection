require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = create(:user)
    post sessions_path, params: { user: { email: @user.email, password: @user.password  }  } 
    assert_redirected_to meals_path
  end

  def test_redirect_to_new_meal
    get new_meal_url
    assert_response :success
  end

  def test_create_new_meal
    assert_difference("Meal.count") do
      create(:user)
      post meals_path, params: { meal: attributes_for(:meal) }
      assert_redirected_to meals_path
    end
  end

  def test_update_meal
    meal = build(:meal, user_id: @user.id)
    assert meal.save
    new_name = Faker::Name.name
    patch meal_path(meal), params: { meal: { name: new_name } } 
    assert_redirected_to meal_path(meal)
    meal.reload
    assert_equal new_name, meal.name
  end

  def test_update_meal_failed
    meal = build(:meal, user_id: @user.id)
    assert meal.save
    new_user = create(:user)
    post sessions_path, params: { user: { email: new_user.email, password: new_user.password  }  } 
    assert_redirected_to meals_path
    new_name = Faker::Name.name
    patch meal_path(meal), params: { meal: { name: new_name } } 
    meal.reload
    assert_not_equal new_name, meal.name
  end
end

