class Admin::PdfsController < ApplicationController
  def new
  end

  def create
    pdf = Pdf.new(pdf_params)
    if pdf.save
      redirect_to admin_dashboard_index_path
      flash[:success] = "Pdf successfully uploaded"
    else
      redirect_to edit_admin_tools_resources_path
      flash[:error] = "Something went wrong with the upload"
    end
  end

  def pdf_params
    params.require(:pdf).permit(:pdf_file)
  end
end
