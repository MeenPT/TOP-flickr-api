require "flickr"

class StaticPagesController < ApplicationController
  def home
    flickr = Flickr.new(ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"])
    @photos = flickr.photos.search(user_id: "201903833@N06")
    @photos = @photos.map { |photo| flickr_photo_url(photo) }
  end

  private

  def flickr_photo_url(flickr_photo)
    "https://live.staticflickr.com/#{flickr_photo.server}/#{flickr_photo.id}_#{flickr_photo.secret}.jpg"
  end
end
