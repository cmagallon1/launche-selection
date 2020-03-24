class UserMailer < ApplicationMailer
  default to: -> { User.where(role: 2).pluck(:email) } ,
    from: 'cesar9mv@gmail.com'

  def new_package
    @user = params[:user]
    @link = "http://localhost:3000/users/#{@user.id}/lunch_packages"
    mail(subject: "New package created by #{@user.name}")
  end
end
