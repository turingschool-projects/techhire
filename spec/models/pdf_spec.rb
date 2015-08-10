require 'rails_helper'

RSpec.describe Pdf, type: :model do
  it "should be valid with a pdf_file and has a paperclip attachment" do
    pdf_file = Rack::Test::UploadedFile.new('spec/fixtures/sample_pdf.pdf', 'application/pdf')
    pdf = Pdf.create(pdf_file: pdf_file)

    expect(pdf).to be_valid
    expect(pdf.pdf_file.class).to eql(Paperclip::Attachment)
    expect(pdf.pdf_file.url).to match(/public\/assets\/pdfs\/sample_pdf.pdf/)
  end

  it "should be invalid with a jpeg_file" do
    pdf_file = File.new(Rails.root.join('spec', 'fixtures', 'whitehouse_jpeg.jpeg'))
    image = build(:pdf, content_id: 4, pdf_file: pdf_file)


    expect(image).to be_invalid
    expect(image.errors.messages[:pdf_file][0]).to eql("Only pdf files are allowed.")
  end
end
