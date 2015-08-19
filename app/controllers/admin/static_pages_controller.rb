class Admin::StaticPagesController < ApplicationController
  before_action :authorize!
  layout "admin_edit_static_application"

  def edit
    name  = clean_params(params)
    @page = Page.find_by(name: name)
    @contents = @page.contents.order("location")
  end

  private

  def clean_params(params)
    case params[:name]
    when "learn_more"
      name = "Learn More"
    when "home"
      name = "Home"
    when "tools_resources"
      name = "Tools and Resources"
    when "techhire_locations"
      name = "TechHire Locations"
    end
  end
end
