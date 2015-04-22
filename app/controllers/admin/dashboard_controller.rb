class Admin::DashboardController < ApplicationController
  def index
    @uncontacted_companies = Company.where(status: "uncontacted")
  end
end
