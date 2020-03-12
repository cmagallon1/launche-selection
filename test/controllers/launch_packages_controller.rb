require 'test_helper'

class LaunchPackagesControllerTest < ActionDispatch::IntegrationTest
  def test_index_method
    get launch_packages_url
    assert_response :success
  end

  def test_new_method
    get new_launch_package_url
    assert_response :success
  end

  def test_create_method
    assert_difference("LaunchPackage.count", +5) do 
      generate_package
      create(:user)
      post launch_packages_path, params: { launch_package: { users: User.all.sample.id, month: LaunchPackage.months.key(rand(12) + 1), meals: Meal.first(5).pluck(:id) } }
      assert_redirected_to meals_path                                                             
    end
  end

  private 
  def generate_package
    5.times do 
      create(:meal)
    end
  end
end
