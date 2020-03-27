class AdminEmailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    EmailService.send_admins_email(user)
  end
end
