require "rails_helper"

RSpec.describe UserEmailer, type: :mailer do
  describe('welcome email') do
    let(:company) { create(:company) }
    let(:full_subject) { "Thanks for signing up for TechHire!" }

    before(:each) do
      @email = UserEmailer.send_welcome_email(company.users.first).deliver_now
    end

    it "sends a welcome email" do
      expect(@email.body).to have_content("Thanks for signing up for TechHire, Google!")
    end

    it "renders the headers" do
      expect(@email.content_type).to start_with('text/html; charset=UTF-8')
    end

    it "sets the correct subject" do
      expect(@email.subject).to eq(full_subject)
    end
  end
end
