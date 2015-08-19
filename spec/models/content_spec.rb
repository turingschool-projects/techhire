require 'rails_helper'

RSpec.describe Content, type: :model do
  describe "null content" do
    it "will assign a default location if null" do
      content =  Content.null
      expect(content.location).to eq(1)
    end
  end
end
