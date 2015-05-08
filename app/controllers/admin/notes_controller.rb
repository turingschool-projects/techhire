class Admin::NotesController < ApplicationController
  # TODO: Make sure this is covered by authorization

  def create
    company = Company.find(params[:company_id])
    company.notes.create(body: notes_params)
    redirect_to admin_company_path(company.id)
  end

  private

  def notes_params
    params.require(:note)
  end
end
