class Admin::DashboardController < ApplicationController
  #before_action :authorize!

  def index
    @dashboard_presenter = DashboardPresenter.new
  end

  private

  #def authorize!
    #unless current_user.admin?
      #redirect_to root_path
    #end
  #end
end
