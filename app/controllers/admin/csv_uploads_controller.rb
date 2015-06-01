class Admin::CsvUploadsController < ApplicationController
  before_action :authorize!

  def new
  end

  def create
    status = Company.csv_upload(csv_tempfile)
    if status[:error]
      flash[:error] = status[:error]
      @invalid = status[:invalid]
      render :new
    else
      flash[:success] = "Successfully uploaded #{status[:created].count} companies."
      redirect_to admin_companies_path
    end
  end

  def csv_tempfile
    params["companies_csv"].tempfile
  end
end
