class MealMailer < ApplicationMailer
  default from: 'cesar9mv@gmail.com'

  def monthly_package
    @user = params[:user]
    @link = "http://localhost:3000/users/#{@user.id}/lunch_packages/new"
    mail(to: @user.email ,subject: "Create your monthly package")
  end
end
