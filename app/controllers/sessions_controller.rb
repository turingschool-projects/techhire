class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      redirect_to admins_dashboard_index_path
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end
end
