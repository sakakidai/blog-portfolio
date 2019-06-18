class Image < ApplicationRecord
  validate :picture_size
  belongs_to :blog
  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
