require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

  def test_create_user_with_invalid_email
    user = attributes_for(:user)
    user[:email] = Faker::Lorem.word
    assert_difference("User.count", 0) do 
      post users_path, params: { user: user } 
      assert_response :success
    end
  end

  def test_create_new_user
    user = attributes_for(:user)
    assert_difference("User.count") do 
      post users_path, params: { user: user } 
      assert_redirected_to meals_path
    end
  end  
end
