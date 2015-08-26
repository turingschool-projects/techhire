class CaseStudiesController < ApplicationController
  layout "static_application"

  def show
    name = clean_params
    @page     = Page.find_by!(name: name)
    @template = StaticTemplateRenderer.new(@page).render
  end

  private

  def clean_params
    case params[:id]
      when "capital_one"
        "Capital One"
      when "rural_sourcing"
        "Rural Sourcing"
      when "xpanxion"
        "Xpanxion"
    end
  end
end
