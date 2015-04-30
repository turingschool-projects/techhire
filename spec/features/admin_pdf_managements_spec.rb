require 'rails_helper'

RSpec.feature "AdminPdfManagements", type: :feature do
  it "can upload a pdf" do
    visit 'admin/pdfs'
    attach_file "pdf[pdf_file]", Rails.root.join('spec', 'fixtures', 'sample_pdf.pdf')
    click_button "Submit"

    expect(page).to have_content("Pdf successfully uploaded")
    expect(current_path).to eql(admin_pdfs_path)
  end

  it "should not allow nothing to be uploaded" do
    visit 'admin/pdfs'
    click_button "Submit"

    expect(page).to have_content("PDF cannot be blank")
    expect(current_path).to eql(admin_pdfs_path)
  end

  it "should not allow a non-pdf to be uploaded" do
    visit 'admin/pdfs'
    attach_file "pdf[pdf_file]", Rails.root.join('spec', 'fixtures', 'whitehouse_jpeg.jpeg')
    click_button "Submit"

    expect(page).to have_content("Something went wrong with the upload")
    expect(current_path).to eql(admin_pdfs_path)

    attach_file "pdf[pdf_file]", Rails.root.join('spec', 'fixtures', 'whitehouse_png.png')
    click_button "Submit"

    expect(page).to have_content("Something went wrong with the upload")
  end
end
