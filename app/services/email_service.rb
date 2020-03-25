class EmailService 
  class << self 
    def send_admins_email(user)
      email = UserMailer.with(user: user).new_package
      email.to = User.where(role: 2).pluck(:email)
      email.deliver_now
    end

    def send_monthly_email
      User.all.each { |user| MealMailer.with(user: user).monthly_package.deliver_now }
    end
  end
end
