require "flickr"

class StaticPagesController < ApplicationController
  def home
    @photos = []

    if params[:flickr_id].present?
      flickr = Flickr.new(ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"])
      @photos = flickr.photos.search(user_id: params[:flickr_id])
      @photos = @photos.map { |photo| flickr_photo_url(photo) }
    end
  end

  private

  def flickr_photo_url(flickr_photo)
    "https://live.staticflickr.com/#{flickr_photo.server}/#{flickr_photo.id}_#{flickr_photo.secret}.jpg"
  end
end
