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
      @user = User.create(email: company_params[:email],
                         name: company_params[:name],
                         title: company_params[:title],
                         password: User.generate_password,
                         company_id: company.id
                        )
      UserEmailer.send_signup_email(@user).deliver
      flash[:success] = "Welcome #{company.name}"
      redirect_to company_path(company.id)
    else
      flash[:errors] = "Please try again!"
      @company = Company.new
      render :new
    end
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
