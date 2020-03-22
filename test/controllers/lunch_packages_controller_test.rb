require 'test_helper'

class LunchPackagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = create(:user)
    post sessions_path, params: { user: { email: @user.email, password: @user.password  }  } 
    assert_redirected_to meals_path
  end

  def test_redirect_to_launch_packages
    get user_lunch_packages_url(@user.id)
    assert_response :success
  end

  def test_redirect_to_new_launch_package
    get new_user_lunch_packages_url(@user.id)
    assert_response :success
  end

  def test_create_lunch_package
    assert_difference("LunchPackage.count", +5) do 
      create(:user)
      generate_package
      post user_lunch_packages_url(@user.id), params: {
        lunch_package:
        { users: 
          User.first.id,
          meals: Meal.first(5).pluck(:id),
          date: { month: LunchPackage.months.values.sample, year: Date.today.year.to_s  }
        }
      }
      assert_response :success                                                          
    end
  end

  def test_update_last_lunch_package
    user = create(:user)
    generate_package
    post sessions_path, params: { user: { email: user.email, password: user.password  }  } 
    assert_redirected_to meals_path
    create(:lunch_package)
    generate_package
    patch user_lunch_packages_path(user.id), params: {
      lunch_package: {
        meals: Meal.pluck(:id).shuffle[0..4]
      }
    }
    assert_redirected_to users_path
  end

  private 
  def generate_package
    5.times do 
      create(:meal)
    end
  end
end
