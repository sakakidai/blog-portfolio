class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def avatar_img
    avatar.thumb.url
  end

  def avatar_img?
    avatar.present?
  end

  def blog_img
    picture.url
  end

  def first_img
    images.first.picture.thumb.url
  end

  def first_img?
    images.present?
  end

  def blog_img?
    picture.present?
  end

  def top_img?
    top_image.present?
  end

end
