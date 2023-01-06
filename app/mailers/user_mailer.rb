class UserMailer < ApplicationMailer
  default from: 'maxelolsson@gmail.com'

  def welcome_email
    @user = params[:user]
    @url = root_url
    mail(to: @user.email, subject: 'Welcome to my Twitter Clone')
  end
end
