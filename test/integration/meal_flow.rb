require 'test_helper'

class MealFlowTest < ActionDispatch::IntegrationTest
  
  def test_can_see_initial_page
    get '/'
    assert_select 'h1', 'Launch Selection'
    assert_select 'a', { :count => 3 } 
  end

  def test_user_can_add_new_entry
    get new_meal_url
    assert_response :success
    post meals_path, params: { meal: attributes_for(:meal)  } 
    assert_response :redirect
    assert_redirected_to meals_url
  end

  def test_user_can_see_errors_in_bad_new_entry
    get new_meal_url
    assert_response :success
    post meals_path, params: { meal: { meal_name:'', image: '' }  } 
    assert_response :success
    assert_select 'div#error_explanation'
    assert_select 'li', {:count => 2}
  end
end
