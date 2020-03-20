require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def test_login_successful
   user = create(:user)
   post sessions_path, params: { user: { name: user.name, password: user.password  }  } 
   assert_redirected_to meals_path
  end

  def test_login_failed
   post sessions_path, params: { user: { name: Faker::Name.name, password: Faker::Name.name  }  } 
   assert_redirected_to new_session_path
  end
end

