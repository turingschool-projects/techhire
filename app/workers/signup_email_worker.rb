class SignupEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    UserEmailer.send_welcome_email(User.find(user_id)).deliver_now
  end
end
