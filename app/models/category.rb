class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :blog_categories, dependent: :destroy
  has_many :blogs, through: :blog_categories
end
