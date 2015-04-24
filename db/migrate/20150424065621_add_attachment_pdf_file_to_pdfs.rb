class AddAttachmentPdfFileToPdfs < ActiveRecord::Migration
  def self.up
    change_table :pdfs do |t|
      t.attachment :pdf_file
    end
  end

  def self.down
    remove_attachment :pdfs, :pdf_file
  end
end
