class UserMailer < ApplicationMailer
  default to: -> { User.where(role: 2).pluck(:email) },
  from: 'cesar9mv@gmail.com'

  def new_package
    @user = params[:user]
    @link = user_lunch_packages_url(@user)
    mail(subject: "New package created by #{@user.name}")
  end
end
