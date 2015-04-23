class PdfsController < ApplicationController

  def show
    pdf = Pdf.find(params[:id])
    send_file pdf.url, :type=>"application/pdf", :x_sendfile=>true
  end
end
