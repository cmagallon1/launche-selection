require 'test_helper'

class LunchPackagesControllerTest < ActionDispatch::IntegrationTest
  def test_redirect_to_launch_packages
    get lunch_packages_url
    assert_response :success
  end

  def test_redirect_to_new_launch_package
    get new_lunch_package_url
    assert_response :success
  end

  def test_create_lunch_package
    assert_difference("LunchPackage.count", +5) do 
      create(:user)
      generate_package
      post lunch_packages_path, params: {
        lunch_package:
        { users: 
          User.first.id,
          meals: Meal.first(5).pluck(:id),
          date: { month: LunchPackage.months.values.sample, year: Date.today.year.to_s  }
        }
      }
      assert_redirected_to meals_path                                                             
    end
  end

  def test_update_last_lunch_package
    user = create(:user)
    generate_package
    post sessions_path, params: { user: { name: user.name, password: user.password  }  } 
    assert_redirected_to meals_path
    create(:lunch_package)
    generate_package
    patch lunch_package_path(user.id), params: {
      lunch_package: {
        meals: Meal.pluck(:id).shuffle[0..4]
      }
    }
    assert_response :success
  end

  private 
  def generate_package
    5.times do 
      create(:meal)
    end
  end
end
