require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:page) { Page.create! do |page|
                page.name          = "TechHire Locations"
                page.number_of_locations = 5
                page.template      = <<-HTML.strip_heredoc
                  <div class="mod-heading location">
                    $LOCATION1
                  </div>
                  <div class="mod-map layout-wrap">
                    $LOCATION2
                    $LOCATION3
                    $LOCATION4
                    $LOCATION5
                  </div>
                HTML
              end }

  describe "will find the correct content" do
    it "raises IndexError if location is less than 1" do
      expect{page.content_for(0)}.to raise_error(IndexError)
    end

    it "raises IndexError if location is greater than number_of_locations" do
      expect{page.content_for(27).to raise_error(IndexError)}
    end

    it "will find content for valid location number" do
      expect{page.content_for(3).to be_valid}
    end
  end
end
