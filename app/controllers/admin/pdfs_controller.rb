class Admin::PdfsController < ApplicationController
  def index
    @pdfs = Pdf.all
  end

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
# <<<<<<< HEAD
#     pdf = Pdf.new(new_pdf_params)
#     if pdf.save
#       flash[:success] = "Pdf successfully uploaded"
#       redirect_to admin_pdfs_path
# =======
    if params[:pdf]
      pdf = Pdf.new(new_pdf_params)
      if pdf.save
        flash[:success] = "Pdf successfully uploaded"
        redirect_to admin_pdfs_path
      else
        flash[:error] = pdf.errors.map { |error, message| message }.first
        redirect_to admin_pdfs_path
      end
# >>>>>>> master
    else
      redirect_to admin_pdfs_path, flash: { error: "PDF cannot be blank" }
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
