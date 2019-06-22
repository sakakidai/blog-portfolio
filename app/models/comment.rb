class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :blog

  scope :recent_5, -> { limit(5).recent }
end
