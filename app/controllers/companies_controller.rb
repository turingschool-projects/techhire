class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    company = Company.new(company_params)
    if company.save
      flash[:success] = "Welcome #{company.organization}"
      redirect_to companies_welcome_path
    else
      flash[:errors] = "Please try again!"
      @company = Company.new
      render :new
    end
  end

  def welcome
  end

  private

  def company_params
    params.require(:company).permit(:name,
                                    :organization,
                                    :title,
                                    :state,
                                    :city,
                                    :email,
                                    :hiring,
                                    :hire_count )
  end
end
