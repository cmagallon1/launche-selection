class AdminEmailService 
  class << self 
    def send_admins_email(user)
      email = UserMailer.with(user: user).new_package
      email.deliver_later
    end
  end
end
