namespace :email do
  desc "Send imail to users to fill his monthly lunch package"
  task send_emails: :environment do
    User.all.each do |user| 
      MealMailer.with(user: user).monthly_package.deliver_now
    end
  end
end
