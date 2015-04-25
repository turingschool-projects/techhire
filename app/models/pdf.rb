class Pdf < ActiveRecord::Base
  has_attached_file :pdf_file,
    :path => "public/assets/pdfs/:basename.:extension",
    :url => "public/assets/pdfs/:basename.:extension"

  validates_attachment_content_type :pdf_file,
                                    :content_type => [ 'application/pdf' ],
                                    :message => "only pdf files are allowed",
                                    :if => :pdf_attached?

  before_save :add_page

  def self.learn_more
    where("page = 'learn more' and slot = 1").first
  end

  def pdf_attached?
    self.pdf_file.present?
  end

  def add_page
    self.page ||= "learn more"
  end
end
