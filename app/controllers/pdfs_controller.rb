class PdfsController < ApplicationController
  def show
    pdf = Pdf.find(params[:id])
    data = open("#{pdf.pdf_file.url}")
    send_data data.read, filename: "#{pdf.pdf_file_file_name}", type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096'
    # redirect_to pdf.pdf_file.url
  end
end
