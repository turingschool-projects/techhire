class Admin::DashboardController < ApplicationController
  def index
    @uncontacted_companies = Company.find_by(status: "uncontacted")
  end
end
