class StaticPagesController < ApplicationController
  def home
  end

  def learn_more
  end

  def tools_resources
  end

  def techhire_locations
  end

  def download
    send_file "public/LearnMore03.pdf", :type=>"application/pdf", :x_sendfile=>true
  end
end
