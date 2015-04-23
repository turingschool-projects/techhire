class Admin::DashboardController < ApplicationController
  before_action :authorize!

  def index
    @uncontacted_companies = Company.where(status: "uncontacted")
    @contacted_companies = Company.where(status: "contacted")
  end

  private

  def authorize!
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
