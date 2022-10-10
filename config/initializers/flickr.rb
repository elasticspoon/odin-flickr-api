Flickr.configure do |config|
  config.api_key       = Figaro.env.flickr_api_key
  config.shared_secret = Figaro.env.flickr_api_secret
end
