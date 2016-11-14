class FoundingFather < ActiveRecord::Base
  mount_uploader :file_name, FoundingFatherUploader

  def get_pictures
    Dir.glob("app/assets/images/switcher/*").map do |f| File.basename f end
  end
end
