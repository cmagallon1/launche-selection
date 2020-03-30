require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def test_login_successful
   user = create(:user)
   post sessions_path, params: { user: { email: user.email, password: user.password  }  } 
   assert_redirected_to meals_url
  end

  def test_login_failed
   post sessions_path, params: { user: { email: Faker::Internet.email, password: Faker::Name.name  }  } 
   assert_redirected_to new_session_path
  end

  def test_logout
    user = create(:user)
    post sessions_path, params: { user: { email: user.email, password: user.password  }  } 
    assert_redirected_to meals_path
    delete session_path(user)
    assert_redirected_to new_session_path
  end
end

