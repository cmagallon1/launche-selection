require 'test_helper'

class RakeTaskEmailTest < ActionMailer::TestCase

  def setup
    require 'rake'
    Rake::Task.define_task :environment
    load "#{Rails.root}/lib/tasks/email.rake"
  end

  def test_rake_task_send_emails  
    user = build(:user, email: 'cmagallon@ucol.mx')
    user.save
    users = User.all
    assert_emails users.size do
      Rake::Task['email:send_emails'].invoke
    end
  end
end
