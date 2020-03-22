require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  def setup 
    @user = create(:user)
    @user.update(role: 2)
  end

  def test_send_new_package_mail
    email = UserMailer.with(user: @user).new_package
    admins = User.where(role: 2).pluck(:email)
    email.to = admins
    assert_emails admins.size do
      email.deliver_now
    end 
  end
end
