class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      flash[:notice] = "You are successfully logged in"
      redirect_to admin_dashboard_index_path
    else
      flash[:notice] = "Incorrect username or password"
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end
end
