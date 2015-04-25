require 'rails_helper'
require 'rack/test'

RSpec.describe Admin::PdfsController, type: :controller do

  it "should create an image" do
    pdf_file = Rack::Test::UploadedFile.new('spec/fixtures/sample_pdf.pdf', 'application/pdf')
    pdf = create(:pdf, pdf_file: pdf_file)

    assert_difference('Pdf.count') do
      post :create, pdf: { page: pdf.page,
                          slot: pdf.slot,
                          pdf_file: pdf_file
                          }
    end

    expect(current_path).to eql(admin_dashboard_index_path)
  end
end
