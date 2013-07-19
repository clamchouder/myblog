class Post < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader #under app>uploaders

  validates :title, presence: true
end
