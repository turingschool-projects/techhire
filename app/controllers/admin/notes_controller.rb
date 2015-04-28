class Admin::NotesController < ApplicationController
  def create
    company = Company.find(params[:company_id])
    note = Note.new(body: notes_params[:notes], company_id: company.id)
    if note.save
      redirect_to admin_company_path(company.id)
    else
    end
  end

  private

  def notes_params
    params.require(:company).permit(:notes)
  end
end
