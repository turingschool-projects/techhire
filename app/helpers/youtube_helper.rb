module YoutubeHelper
  # Look below for expanded code
  class << YoutubeHelper
    include YoutubeHelper
    include ActionView::Helpers::TagHelper
  end

  # the embed method will accept a regular youtube url and convert it into an embed url
  # In our view, we can just call <%= YoutubeHelper.embed(some youtube url) %>
  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end

# #equiv to:
# YoutubeHelper.extend(YoutubeHelper)
#
# #equiv to:
# extend self
#
# #equiv to:
# YoutubeHelper.singleton_class.class_eval do
#   include YoutubeHelper
# end
