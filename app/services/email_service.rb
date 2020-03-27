class EmailService 
  class << self 
    def send_admins_email(user)
      email = UserMailer.with(user: user).new_package
      email.deliver_later
    end

    def send_monthly_email
      User.all.each { |user| MealMailer.with(user: user).monthly_package.deliver_later }
    end
  end
end
