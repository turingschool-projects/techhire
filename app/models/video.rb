class Video < ActiveRecord::Base
  validates :url, presence: true
  validate :verify_youtube_video

  def verify_youtube_video
    yt_regex = /www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/
    if !self.url.match(yt_regex)
      errors.add[:error] << "Please check your YouTube format."
    end
  end
end
