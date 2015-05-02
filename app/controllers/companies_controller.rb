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
      password = User.generate_password
      user = User.create(email: company_params[:email],
                          name: company_params[:name],
                          title: company_params[:title],
                          password: password,
                          company_id: company.id
                          )
      flash[:success] = "Welcome #{company.organization}"
      UserEmailer.send_welcome_email(user, password).deliver_now
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
