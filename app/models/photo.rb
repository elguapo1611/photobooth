class Photo < ActiveRecord::Base
  def image_url
    "/assets/booth/img#{id}.jpg"
  end

  def capture
    %x(gphoto2 --capture-image-and-download --filename=#{image_url(photo.id)})
  end

  def self.in_groups
    photos = Photo.order("created_at DESC").all.to_a 
    groups = []
    while photos.present?
      groups << photos.slice!(0, rand(5)+1)
    end
    groups
  end

  def self.most_recent_photo
    Pathname.new(Dir.glob("#{Rails.root}/app/assets/images/booth/*").max_by {|f| File.mtime(f)})
  end

  def self.next_photo_number

  end

end
