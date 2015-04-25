require 'rails_helper'

RSpec.describe PdfsController, type: :controller do
  it "should respond back with a pdf" do
    Paperclip::Attachment.any_instance.stub(:url).and_return("spec/fixtures/sample_pdf.pdf")

    pdf_file = Rack::Test::UploadedFile.new('spec/fixtures/sample_pdf.pdf', 'application/pdf')
    pdf = create(:pdf, pdf_file: pdf_file)
    get :show, {id: pdf.id}

    expect(response.headers["Content-Type"]).to eql("application/pdf")
    expect(response.headers["Content-Disposition"]).to match(/sample.pdf.pdf/)
  end

end
