class SignupEmailWorker
  include Sidekiq::Worker

  def perform(company_id)
    CompanyMailer.welcome_email(Company.find(company_id)).deliver_now
  end
end
