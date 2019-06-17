class Image < ApplicationRecord
  belongs_to :blog
  mount_uploader :picture, PictureUploader
end
