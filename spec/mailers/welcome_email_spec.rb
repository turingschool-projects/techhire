require "rails_helper"

RSpec.describe UserEmailer, type: :mailer do
  describe('welcome email') do
    let(:user) { build(:user) }
    let(:full_subject) { "Thanks for signing up for TechHire!" }
    #let(:mail) { mailer_class.email(user) }

    before(:each) do
      @email = UserEmailer.send_welcome_email(user).deliver_now
    end

    it "sends a welcome email" do

      # assert_equal ['laurawhalin@gmail.com'], email.from
      # assert_equal ['test@example.com'], email.to
      # assert_equal "Thanks for signing up for TechHire!", email.subject
      # assert_equal "Someone from Opportunity At Work will contact you soon with more details.", email.body.to_s
    end

    it "renders the headers" do
      @email.content_type.should start_with('multipart/alternative')
    end

    it "sets the correct subject" do
      @email.subject.should eq(full_subject)
    end
  end
end
