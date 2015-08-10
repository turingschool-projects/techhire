require 'rails_helper'
require 'rack/test'

RSpec.describe Admin::PdfsController, type: :controller do

  it "should create an image" do
    pdf_file = Rack::Test::UploadedFile.new('spec/fixtures/sample_pdf.pdf', 'application/pdf')
    pdf = Pdf.create!(content_id: 98, pdf_file: pdf_file)

    post :create, pdf: {
                        pdf_file: pdf_file
                        }

    expect(response).to redirect_to("/admin/pdfs")
  end

  it "can delete a pdf" do
    pdf_file = Rack::Test::UploadedFile.new('spec/fixtures/sample_pdf.pdf', 'application/pdf')
    pdf = Pdf.create(content_id: 98, pdf_file: pdf_file)
    delete :destroy, {id: pdf.id}
    expect(response).to redirect_to("/admin/pdfs")
    expect(Pdf.count).to eq(0)
  end

end
