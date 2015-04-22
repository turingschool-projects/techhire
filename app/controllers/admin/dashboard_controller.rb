class Admin::DashboardController < ApplicationController
  def index
    @uncontacted_companies = Company.where(status: "uncontacted")
    @contacted_companies = Company.where(status: "contacted")
  end
end
