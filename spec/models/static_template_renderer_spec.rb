require 'rails_helper'

RSpec.describe StaticTemplateRenderer, type: :model do
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

  def build_content
    Content.create! page_id: page.id, location: 3, body: <<-HTML.strip_heredoc
        <h1>How Capital One is doing it</h1>
        <div class="embed-container">
          <h1>Hello!</h1>
        </div>
        <p>&nbsp;</p>
      HTML
  end

  it "will render the without any content set" do
    rendered_page = StaticTemplateRenderer.new(page).render
    expect(rendered_page).to include("Not yet set")
    expect(rendered_page).not_to include("$LOCATION(\d)")
  end

  it "will render content for location if available" do
    build_content
    rendered_page = StaticTemplateRenderer.new(page).render
    expect(rendered_page).to include("<h1>How Capital One is doing it</h1>")
  end
end
