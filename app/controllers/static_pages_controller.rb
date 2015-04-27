class StaticPagesController < ApplicationController
  def home
  end

  def learn_more
  end

  def tools_resources
    @pdf = Pdf.learn_more
  end

  def techhire_locations
    @companies = Company.all
  end
end
