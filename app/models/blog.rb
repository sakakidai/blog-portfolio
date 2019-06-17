class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :body, presence: true, length: { minimum: 5, maxmum: 500 }
  validates :user_id, presence: true
  belongs_to :user
end
