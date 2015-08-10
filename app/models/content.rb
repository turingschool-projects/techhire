class Content < ActiveRecord::Base
  validates :body, presence: { message: "The body can't be blank." },
                   uniqueness: { message: "There cannot be duplicate bodies." }
  belongs_to :page

  def self.null(location=1)
    new location: location, body: "Not yet set"
  end

end
