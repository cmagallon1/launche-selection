namespace :email do
  desc "Send imail to users to fill his monthly lunch package"
  task send_emails: :environment do
    UserEmailsJob.perform_now
  end
end
