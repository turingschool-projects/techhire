class Admin::NotesController < ApplicationController
  def create
    company = Company.find(params[:company_id])
    Note.create(body: notes_params, company_id: company.id)
    redirect_to admin_company_path(company.id)
  end

  private

  def notes_params
    params.require(:note)
  end
end
