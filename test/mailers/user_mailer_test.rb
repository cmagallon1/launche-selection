require 'test_helper'
require 'sidekiq/testing'

class UserMailerTest < ActionMailer::TestCase
  def setup 
    @user = build(:user, email: 'cesar9mv@gmail.com')
    @user.save
    @user.update(role: 2)
  end

  def test_job_being_enqueued_correctly
    assert_equal 0, Sidekiq::Queues['emails'].size
    Sidekiq::Client.push(
      'class' => 'UserMailer',
      'queue' => 'emails',
      'args' => [1]
    )
    assert_equal 1, Sidekiq::Queues['emails'].size
    assert_equal 'UserMailer', Sidekiq::Queues['emails'].first['class']
    Sidekiq::Queues['emails'].clear
  end

  def test_admin_email_job
    assert_emails 1 do 
      AdminEmailsJob.perform_now(@user)
    end
  end

  def test_send_new_package_mail
    email = UserMailer.with(user: @user).new_package
    assert_emails 1 do
      email.deliver_now
    end 
  end
end
