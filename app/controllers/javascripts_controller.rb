class JavascriptsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def dynamic_cities
    @cities = UsaCity.all
  end

end
