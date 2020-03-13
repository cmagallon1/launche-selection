require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_save_user
    assert create(:user)
  end

  def test_save_user_without_params
    user = User.new
    assert_not user.valid?
  end

end
