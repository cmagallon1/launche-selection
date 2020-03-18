require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def test_assign_admin_role_to_user
    user = User.new({ name: Faker::Name.name, password: Faker::Lorem.word, role: 1 })
    assert user.valid?
    assert user.admin?
  end
end
