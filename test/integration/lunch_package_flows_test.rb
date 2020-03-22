require 'test_helper'

class LunchPackageFlowTest < ActionDispatch::IntegrationTest

  def setup
    @user = create(:user)
    post sessions_path, params: { user: { email: @user.email, password: @user.password  }  } 
    assert_redirected_to meals_path
  end
  
  def test_user_can_save_month_package
    get new_user_lunch_packages_url(@user.id)
    assert_response :success
    assert_select 'h1', 'Build your monthly package'
    create_meals
    post user_lunch_packages_path,
      params: { 
      lunch_package:  { 
        users: @user.id , 
        meals: Meal.first(5).pluck(:id),
        date: { month: LunchPackage.months.values.sample, year: Date.today.to_s } 
      } } 
    assert_response :success
  end

  def test_user_can_see_peer_lunch_packages
    get new_user_lunch_packages_url(@user.id)
    assert_response :success
    create_meals
    month = LunchPackage.months.values.sample
    year = Date.today.year.to_s
    post user_lunch_packages_path,
      params: { 
      lunch_package:  { 
        users: @user.id , 
        meals: Meal.first(5).pluck(:id),
        date: { month: month, year: year } 
      } } 
    assert_response :success
    get users_url
    assert_response :success
    get user_lunch_packages_url(@user.id)
    assert_select 'h1', 'Monthly meals'
  end

  def create_meals
    5.times do
      create(:meal)
    end
  end

end
