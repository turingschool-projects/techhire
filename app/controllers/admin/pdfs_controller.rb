class Admin::PdfsController < ApplicationController
  def new
  end

  def create
    pdf = Pdf.new(new_pdf_params)
    if pdf.save
      flash[:success] = "Pdf successfully uploaded"
      redirect_to admin_dashboard_index_path
    else
      flash[:error] = "Something went wrong with the upload"
      redirect_to edit_admin_tools_resources_path
    end
  end

  def new_pdf_params
    params.require(:pdf).permit(:pdf_file, :slot)
  end
end
