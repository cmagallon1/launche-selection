class MonthlyEmailService
  class << self
    def send_monthly_email
      User.all.each { |user| MealMailer.with(user: user).monthly_package.deliver_later }
    end
  end
end