class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :body, presence: true, length: { minimum: 5, maxmum: 500 }
  validates :user_id, presence: true
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :favarites, dependent: :destroy
  has_many :favarite_users, through: :favarites, source: :user

  accepts_nested_attributes_for :images, allow_destroy: true

  scope :recent, -> { order(updated_at: :desc) }
  scope :post_ranking, -> { group(:user_id).order(Arel.sql("count(user_id) desc")).limit(4).pluck(:user_id) }

  def favarited_by?(user)
    favarites.find_by(user_id: user.id).present?
  end

  def images?
    images.present?
  end

  def favarite_users?
    favarite_users.present?
  end
end
