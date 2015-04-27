FactoryGirl.define do
  factory :pdf do
    page "learn more"
    slot 1
    pdf_file File.new(Rails.root.join('spec', 'fixtures', 'sample_pdf.pdf'))
  end
end
