require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_save_user
    assert create(:user)
  end

  def test_save_user_without_params
    user = User.new
    assert_not user.save
  end

  def test_meal_is_related_with_users
    create(:user)
    create(:meal)
    create(:launch_package)
    assert User.all.sample.meals
  end
end
