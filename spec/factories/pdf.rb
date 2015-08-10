FactoryGirl.define do
  factory :pdf do
    pdf_file File.new(Rails.root.join('spec', 'fixtures', 'sample_pdf.pdf'))
  end
end
