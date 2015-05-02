require "rails_helper"

RSpec.describe UserEmailer, type: :mailer do
  it "sends a welcome email" do
    user = build(:user)
    email = UserEmailer.send_welcome_email(user).deliver_now

    let(:full_subject) { "Thanks for signing up for TechHire!" }
    let(:mail) { mailer_class.email(user) }
    # assert_equal ['laurawhalin@gmail.com'], email.from
    # assert_equal ['test@example.com'], email.to
    # assert_equal "Thanks for signing up for TechHire!", email.subject
    # assert_equal "Someone from Opportunity At Work will contact you soon with more details.", email.body.to_s

    it "renders the headers" do
      mail.content_type.should start_with('multipart/alternative')
    end

    it "sets the correct subject" do
      mail.subject.should eq(full_subject)
    end


  end
end
