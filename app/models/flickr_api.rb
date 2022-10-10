class FlickrAPI
  # def self.flickr
  #   @flickr ||= Flickr.new(Figaro.env.flickr_api_key, Figaro.env.flickr_api_secret)
  # end

  def self.get_user(user_id)
    Flickr.people.find(user_id)
  end

  def self.get_user_photos(user_id)
    user_id && Flickr.photos.search(user_id:)
  rescue NameError => _e
    :user_not_found
  end
end
