class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validate :avatar_size
  validate :top_image_size
  mount_uploader :avatar, PictureUploader
  mount_uploader :top_image, PictureUploader
  has_many :blogs, dependent: :destroy
  has_many :favarites, dependent: :destroy
  has_many :favarite_blogs, through: :favarites, source: :blog
  has_many :comments, dependent: :destroy

  scope :recent_5, -> { limit(5).recent }
  
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
