class Page < ActiveRecord::Base
  has_many :contents
  validates :name, uniqueness: true
  scope :nav_pages, -> {where(navigation: true)}

  def content_for(n)
    raise IndexError if n < 1
    raise IndexError if n > number_of_locations
    content = contents.find { |content| content.location == n }
    content || Content.null(n)
  end
end
