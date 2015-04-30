require 'time'
class Pdf < ActiveRecord::Base
  has_attached_file :pdf_file,
    :path => "public/assets/pdfs/:basename.:extension",
    :url => "public/assets/pdfs/:basename.:extension"

  validates_attachment_content_type :pdf_file,
                                    :content_type => [ 'application/pdf' ],
                                    :message => "only pdf files are allowed",
                                    :if => :pdf_attached?

  def self.learn_more
    where("slot = 1").first
  end

  def pdf_attached?
    self.pdf_file.present?
  end

  def update_formatter
    time = self.pdf_file_updated_at.strftime("%b %e, %l:%M %p")
  end
end
