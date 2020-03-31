class AdminEmailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    AdminEmailService.send_admins_email(user)
  end
end
