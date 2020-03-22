require 'test_helper'

class MealMailerTest < ActionMailer::TestCase
  def test_send_email_to_users
    User.all.each do |user|
      email = MealMailer.with(user: user).monthly_package
      email.to = user.email
      assert_emails 1 do
        email.deliver_now
      end
    end
  end
end
