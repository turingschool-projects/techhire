class Admin::CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def destroy
    Company.find(params[:id]).destroy
    redirect_to admin_dashboard_index_path
  end

  def update
    company = Company.find(params[:id])
    company.update(status: params[:company][:status])
    company.save
    redirect_to admin_company_path(company.id)
  end
end
