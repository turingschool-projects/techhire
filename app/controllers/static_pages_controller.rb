class StaticPagesController < ApplicationController
  layout "static_application"

  def show
    @page     = Page.find_by!(name: params[:name])
    @template = StaticTemplateRenderer.new(@page).render
  end

end
