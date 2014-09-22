class PhotosController < ApplicationController
  def index
    @photos = Photo.order("created_at DESC")
  end

  def create
    kill_ptp_camera
    photo = Photo.create
    %x(gphoto2 --capture-image-and-download --filename=#{image_url(photo.id)})
    render :json => {"image_url" => "/assets/booth/img#{photo.id}.jpg"}
  end

  private

  def image_url(photo_id)
    "./app/assets/images/booth/img#{photo_id}.jpg"
  end

  def kill_ptp_camera
    `killall PTPCamera`
  rescue
  end
end
