require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:organization) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:email) }
  it do
    should allow_value('company@email.com',
                       'company.name@email.com',
                       'company_name@email.com'
                      ).for(:email)
  end
  it do
    should_not allow_value('company@email',
                           'company.com',
                           'company'
                          ).for(:email)
  end
end
