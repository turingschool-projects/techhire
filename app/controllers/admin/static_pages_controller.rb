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
        "Learn More"
      when "home"
        "Home"
      when "tools_resources"
        "Tools and Resources"
      when "techhire_locations"
        "TechHire Locations"
      when "capital_one"
        "Capital One"
      when "rural_sourcing"
        "Rural Sourcing"
      when "xpanxion"
        "Xpanxion"
    end
  end
end
