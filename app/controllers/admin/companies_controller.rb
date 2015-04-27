class Admin::CompaniesController < ApplicationController
  def index
    @companies = Company.all
    # @uncontacted_companies = Company.where(status: "uncontacted")
    # @contacted_companies = Company.where(status: "contacted")
  end
end
