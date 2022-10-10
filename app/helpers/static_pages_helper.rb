module StaticPagesHelper
  def photo_url(photo)
    "https://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_m.jpg"
  end
end
