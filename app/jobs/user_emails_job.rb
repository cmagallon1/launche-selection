class UserEmailsJob < ApplicationJob
  queue_as :default

  def perform
    MonthlyEmailService.send_monthly_email
  end
end
