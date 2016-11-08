class Exec < ActiveRecord::Base
  mount_uploader :file_name, ExecUploader

  validates :name, presence: true
  validates :title, presence: true

  def get_pictures
    Dir.glob("app/assets/images/switcher/*").map do |f| File.basename f end
  end
end
