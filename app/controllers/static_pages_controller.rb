class StaticPagesController < ApplicationController
  def home
  end

  def learn_more
  end

  def tools_resources
  end

  def techhire_locations
  end

  def download(file)
    send_file "public/#{file}.pdf", :type=>"application/pdf", :x_sendfile=>true
  end
end
