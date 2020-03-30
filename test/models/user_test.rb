require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_save_user
    assert create(:user)
  end

  def test_save_user_without_params
    user = User.new
    assert_not user.valid?
  end

  def test_assign_admin_role_to_user
    user =  build(:user)
    assert user.valid?
    user.save
    user.update(role: 2)
    assert user.admin?
  end

  def test_save_user_without_name
    user = build(:user, name: nil)
    assert_not user.valid?
  end

  def test_save_user_without_email
    user = build(:user, email: nil)
    assert_not user.valid?
  end

  def test_save_user_with_invalid_email
    user = build(:user, email: Faker::Lorem.word)
    assert_not user.valid?
  end

end
