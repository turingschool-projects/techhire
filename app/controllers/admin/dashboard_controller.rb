class Admin::DashboardController < ApplicationController
  before_action :authorize!

  def index
    @companies = Company.all
  end
end
