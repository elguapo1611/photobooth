class Camera
  def self.capture(number=0)
    %x(gphoto2 --capture-image-and-download --filename=img#{number}.jpg)
  end

  private

  def self.folder
    Rails.root + 'public' + 'images'
  end
end