class Admin::PdfsController < ApplicationController
  def new
  end

  def create
    redirect_to admin_dashboard_index_path
  end
end
