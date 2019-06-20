class Image < ApplicationRecord
  validate :picture_size
  validate :picture_presence
  belongs_to :blog
  mount_uploader :picture, PictureUploader

  scope :picture_having, -> { group(:blog_id).limit(5).pluck(:blog_id) }

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

  def picture_presence
    if picture.blank?
      errors.add(:picture, "写真のリンクを削除するかファイルを添付してください")
    end
  end
end
