# Preview all emails at http://localhost:3000/rails/mailers/welcome_email
class WelcomeEmailPreview < ActionMailer::Preview
  def welcome_user
    user = Company.last.users.first
    password = "password"
    UserEmailer.send_welcome_email(user, password)
  end
end
