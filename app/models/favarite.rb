class Favarite < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  scope :iine_ranking, -> { group(:blog_id).order(Arel.sql('count(blog_id) desc')).limit(4).pluck(:blog_id) }
end
