class UserEmailer < ApplicationMailer
  default from: 'laurawhalin@gmail.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_welcome_email(user, password)
    @user = user
    @password = password
    mail( to: @user.email,
    subject: 'Thanks for signing up for TechHire!' )
  end
end
