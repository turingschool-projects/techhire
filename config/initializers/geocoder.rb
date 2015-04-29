Geocoder.configure({
  lookup: :bing,
  key: ENV['BING_API_KEY'],
  cache: Rails.cache
})
