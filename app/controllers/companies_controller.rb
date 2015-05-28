class CompaniesController < ApplicationController
  layout "static_application", only: [:new, :create,:welcome]
  before_action :authorize_company!, only: [:show]

  def new
    @company = Company.new
    @registration = RegistrationPresenter.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Welcome #{@company.organization}"
      redirect_to companies_welcome_path
    else
      flash[:error] = "Please try again!"
      @registration = RegistrationPresenter.new
      render :new
    end
  end

  def welcome
  end

  private

  def company_params
    cp = params.require(:company).permit(
      :name,
      :organization,
      :title,
      :state,
      :city,
      :zip_code,
      :email,
      :organization_type,
      :techhire_involvement,
      :interest_hiring,
      :interest_training,
      :interest_connecting,
      :interest_supporting,
      :interest_community,
    )
    if params[:company][:hiring] == "1"
      cp.merge(hiring: true, hire_count: params[:company][:hire_count].to_i)
    else
      cp
    end
  end
end
