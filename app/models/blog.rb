class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :body, presence: true, length: { minimum: 5, maxmum: 500 }
  validates :user_id, presence: true
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :recent, -> { order(updated_at: :desc) }

end
