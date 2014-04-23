class Photo < ActiveRecord::Base
  def image_url
    "/assets/img#{id}.jpg"
  end

  def self.in_groups
    photos = Photo.order("created_at DESC").all.to_a 
    groups = []
    while photos.present?
      groups << photos.slice!(0, rand(5)+1)
    end
    groups
  end

end
