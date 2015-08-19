require 'rails_helper'
require 'rack/test'

RSpec.describe Admin::PdfsController, type: :controller do
  let(:admin) do
    create(:user)
  end

  let(:pdf_file) { Rack::Test::UploadedFile.new('spec/fixtures/sample_pdf.pdf', 'application/pdf') }
  let(:pdf) { Pdf.create!(content_id: 98, pdf_file: pdf_file) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(admin)
  end



  it "should create an image" do
    post :create, pdf: {
                        pdf_file: pdf_file
                        }

    expect(response).to redirect_to("/admin/pdfs")
  end

  it "can delete a pdf" do
    delete :destroy, {id: pdf.id}
    expect(response).to redirect_to("/admin/pdfs")
    expect(Pdf.count).to eq(0)
  end

  describe "Create" do
    it "will redirect to index if pdf param is blank" do
      post :create
      expect(response).to redirect_to(admin_pdfs_path)
    end
  end

  describe "Index" do
    it "renders corect template" do
      get :index
      expect(response).to render_template("index")
    end

     it "assigns @teams" do
      get :index
      expect(assigns(:pdfs)).to eq(Pdf.all)
    end
  end

end
