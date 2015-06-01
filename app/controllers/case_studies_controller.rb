class CaseStudiesController < ApplicationController
  layout "static_application"

  def show
    render "case_studies/#{params[:id]}"
  end
end
