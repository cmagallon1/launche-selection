require 'test_helper'

class UsersFlowTest < ActionDispatch::IntegrationTest

  def test_create_new_user
    get '/'
    assert_response :success 
    get new_user_url
    assert_response :success
    assert_difference("User.count") do 
      post users_path, params: { user: attributes_for(:user) }    
      assert_redirected_to meals_path
    end
  end

  def test_invalid_new_user
    get '/'
    assert_response :success 
    get new_user_url
    assert_response :success
    assert_difference("User.count", 0) do 
      user = attributes_for(:user)
      user[:email] = Faker::Lorem.word
      post users_path, params: { user: user}    
      assert_response :success
    end
  end  

end
