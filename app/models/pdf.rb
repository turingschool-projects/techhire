class Pdf < ActiveRecord::Base
  validates :slot, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1,
                                   less_than_or_equal_to: 4
                                  },
                                  allow_blank: true

                                                  }

  validates :page, inclusion: { in: ["tools and resources",
                                      "learn more",
                                      "home",
                                      "techhire locations",
                                      "start hiring"]
                              },
                                allow_blank: true
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
end
