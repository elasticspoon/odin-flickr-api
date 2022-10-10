class FlickrAPI
  # def self.flickr
  #   @flickr ||= Flickr.new(Figaro.env.flickr_api_key, Figaro.env.flickr_api_secret)
  # end

  def self.get_user(user_id)
    Flickr.people.find(user_id)
  end

  def self.get_user_photos(user_id)
    Flickr.photos.search(user_id:)
  rescue Faraday::Error::TimeoutError => e
    []
  end
end
