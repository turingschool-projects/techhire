module YoutubeHelper
  # the embed method will accept a regular youtube url and convert it into an embed url
  # In our view, we can just call <%= embed(some youtube url) %>
  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end
