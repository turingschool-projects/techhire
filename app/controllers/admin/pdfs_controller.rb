class Admin::PdfsController < ApplicationController
  def index
    @pdfs = Pdf.all
  end

  def new
  end

  def create
    if params[:pdf]
      pdf = Pdf.new(new_pdf_params)
      if pdf.save
        flash[:success] = "Pdf successfully uploaded"
        redirect_to admin_pdfs_path
      else
        flash[:error] = "Something went wrong with the upload"
        redirect_to admin_pdfs_path
      end
    else
      redirect_to admin_pdfs_path, flash: { error: "PDF cannot be blank" }
    end
  end

  def new_pdf_params
    params.require(:pdf).permit(:pdf_file, :slot)
  end
end
