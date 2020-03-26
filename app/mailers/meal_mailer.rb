class MealMailer < ApplicationMailer
  default to: -> { User.all.pluck(:email) },
    from: 'cesar9mv@gmail.com'

  def monthly_package
    @user = params[:user]
    @link = new_user_lunch_packages_url(@user.id)
    mail(to: @user.email ,subject: "Create your monthly package")
  end
end
