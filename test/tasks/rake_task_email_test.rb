require 'test_helper'
require 'rake'

class RakeTaskEmailTest < ActionMailer::TestCase
  def test_rake_task_send_emails  
    user = build(:user, email: 'cmagallon@ucol.mx')
    user.save
    users = User.all
    Rake::Task['email:send_emails'].invoke
    assert_emails users.size
  end
end
