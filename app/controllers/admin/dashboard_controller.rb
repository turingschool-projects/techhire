class Admin::DashboardController < ApplicationController
  def index
    @dashboard_presenter = DashboardPresenter.new
  end
end
