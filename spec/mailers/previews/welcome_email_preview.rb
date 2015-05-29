# Preview all emails at http://localhost:3000/rails/mailers/welcome_email
class WelcomeEmailPreview < ActionMailer::Preview
  def welcome_user
    company = Company.last
    CompanyMailer.welcome_email(company)
  end
end
