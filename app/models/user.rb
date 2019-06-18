class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validate :avatar_size
  validate :top_image_size
  has_many :blogs, dependent: :destroy
  mount_uploader :avatar, PictureUploader
  mount_uploader :top_image, PictureUploader

  private

  def avatar_size
    if avatar.size > 5.megabytes
      errors.add(:avatar, "should be less than 5MB")
    end
  end

  def top_image_size
    if top_image.size > 5.megabytes
      errors.add(:top_image, "should be less than 5MB")
    end
  end
end
