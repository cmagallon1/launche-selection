require 'test_helper'

class LunchPackageFlowTest < ActionDispatch::IntegrationTest
  
  def test_user_can_save_month_package
    get new_lunch_package_url
    assert_response :success
    assert_select 'h3', { :count => 3 }
    assert_select 'select', { :count => 4 }
    assert_select 'input'
    user = create(:user)
    create_meals
    post lunch_packages_path,
      params: { 
      launch_package:  { 
        users: user.id , 
        meals: Meal.first(5).pluck(:id),
        date: { month: LunchPackage.months.values.sample, year: Date.today.to_s } 
      } } 
    assert_response :redirect
    assert_redirected_to meals_url
  end

  def test_user_can_see_peer_lunch_packages
    get new_lunch_package_url
    assert_response :success
    user = create(:user)
    create_meals
    month = LunchPackage.months.values.sample
    year = Date.today.year.to_s
    post lunch_packages_path,
      params: { 
      launch_package:  { 
        users: user.id , 
        meals: Meal.first(5).pluck(:id),
        date: { month: month, year: year } 
      } } 
    assert_response :redirect
    assert_redirected_to meals_url
    get launch_packages_url
    assert_select 'h1', 'Meals per user'
    assert_select 'h2', LunchPackage.months.key(month)
  end

  def create_meals
    5.times do
      create(:meal)
    end
  end

end
