class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def show
  end

  def create
    user = User.create(email: company_params[:email], name: company_params[:name], title: company_params[:title], password: 'abc123abc')
    binding.pry
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Welcome #{@company.name}"
      redirect_to root_path
    else
      flash[:errors] = "Please try again!"
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
