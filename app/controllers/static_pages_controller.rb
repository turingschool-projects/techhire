class StaticPagesController < ApplicationController
  layout "static_application"

  def show
    if params[:name].nil?
      puts "\e[31mExpected params[:name] to be something like 'home', but it's nil!\e[0m"
      p params
    end
    @page     = Page.find_by!(name: params[:name])
    @template = StaticTemplateRenderer.new(@page).render
  end
end
