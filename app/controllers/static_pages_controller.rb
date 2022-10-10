class StaticPagesController < ApplicationController
  before_action :search_photos

  def index
  end

  private

  def search_params
    params.permit(:user_id).compact_blank
  end

  def search_photos
    @photos = FlickrAPI.get_user_photos(search_params[:user_id])
    flash.now.alert = 'User not found.' if @photos == :user_not_found
  end
end
