class Admin::CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def destroy
    Company.find(params[:id]).destroy
    redirect_to admin_dashboard_index_path
  end
end
