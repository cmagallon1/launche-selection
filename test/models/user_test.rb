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
    user = User.new( name: Faker::Name.name, password: Faker::Lorem.word, role: 2 )
    assert user.admin?
    assert user.valid?
    assert user.common?
  end

end
