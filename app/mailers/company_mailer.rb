class CompanyMailer < ApplicationMailer
  default from: 'info@opportunityatwork.org'

  def welcome_email(company)
    @company = company
    mail( to: @company.email,
          subject: 'Thanks for signing up for TechHire!'
          )
  end
end
