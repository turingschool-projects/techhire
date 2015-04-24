class Pdf < ActiveRecord::Base
  has_attached_file :pdf_file,
    :storage => :s3,
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml",
    :path => "/public/assets/pdfs/:id.:extension"

    validates_attachment_content_type :pdf,
                                      :content_type => [ 'application/pdf' ],
                                      :message => "only pdf files are allowed",
                                      :if => :pdf_attached?

  def self.learn_more
    where("page = 'tools and resources' and slot = 1").first
  end

  def pdf_attached?
    self.pdf_file.exists?
  end
end
