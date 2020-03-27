class UserEmailsJob < ApplicationJob
  queue_as :default

  def perform
    EmailService.send_monthly_email
  end
end
