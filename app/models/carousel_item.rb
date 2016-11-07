class CarouselItem < ActiveRecord::Base
  mount_uploader :file_name, PictureUploader

  validates :title, presence: true
  validates :body, presence: true

  def get_pictures
    Dir.glob("app/assets/images/switcher/*").map do |f| File.basename f end
  end
end
