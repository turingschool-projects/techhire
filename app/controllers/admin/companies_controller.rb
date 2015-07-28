class Admin::CompaniesController < ApplicationController
  before_action :authorize!
  before_action :authorize_company!, only: [:show, :update, :edit]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def destroy
    Company.find(params[:id]).destroy
    redirect_to admin_companies_path
  end

  def update
    company = Company.find(params[:id])
    if company.update(update_params)
      redirect_to admin_company_path(company.id)
    else
      flash[:errors] = "Please try again!"
      render :edit
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  private

  def update_params
    params.require(:company).permit(:name, :organization, :title,
                                    :state, :city, :email,
                                    :hiring, :status, :hire_count,
                                    :zip_code, :organization_type,
                                    :techhire_involvement, :interest_hiring,
                                    :interest_training, :interest_connecting,
                                    :interest_supporting, :interest_community)
  end
end
