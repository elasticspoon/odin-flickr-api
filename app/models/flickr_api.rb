class FlickrAPI
  def self.flickr
    Flickr
  end

  def self.get_user_photos(user_id)
    user_id && flickr.photos.search(user_id:)
  rescue NameError => _e
    :user_not_found
  end
end
