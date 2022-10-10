class StaticPagesController < ApplicationController
  before_action :search_photos

  def index
  end

  private

  def search_params
    params.permit(:user_id)
  end

  def search_photos
    @photos = FlickrAPI.get_user_photos(search_params[:user_id])
  end
end
