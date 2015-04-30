class Admin::PdfsController < ApplicationController
  def new
  end

  def index
    @pdfs = Pdf.all
  end

  def show
    pdf = Pdf.find(params[:id])
    data = open("#{pdf.pdf_file.url}")
    send_data data.read, filename: "#{pdf.pdf_file_file_name}", type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096'
    # redirect_to pdf.pdf_file.url
  end

  def create
    pdf = Pdf.new(new_pdf_params)
    if pdf.save
      flash[:success] = "Pdf successfully uploaded"
      redirect_to admin_pdfs_path
    else
      flash[:error] = "Something went wrong with the upload"
      redirect_to edit_admin_tools_resources_path
    end
  end

  def destroy
    Pdf.find(params[:id]).destroy
    redirect_to admin_pdfs_path
  end

  private

  def new_pdf_params
    params.require(:pdf).permit(:pdf_file, :slot)
  end
end
