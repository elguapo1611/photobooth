class Camera
  def self.capture(number=0)
    %x(gphoto2 --capture-image-and-download --filename=#{image_url(photo.id)})
    %x(gphoto2 --capture-image-and-download --filename=img#{number}.jpg)
  end

  private

  def self.folder
    Rails.root + 'app' + 'assets' + 'images' + 'booth'
  end
end