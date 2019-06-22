ActiveAdmin.register User do
  permit_params :name, :color, :avatar, :top_image, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :color
    column :top_image do |image|
      image.top_image.url.present? ? image_tag(image.top_image.thumb.url) : content_tag(:span, "イメージがありません")
    end
    column :avatar do |image|
      image.top_image.url.present? ? image_tag(image.avatar.thumb.url) : content_tag(:span, "イメージがありません")
    end
    actions
  end

  show do |item_image|
    attributes_table do
      row :name
      row :email
      row :color
      row :top_image do |image|
        image.top_image.url.present? ? image_tag(image.top_image.thumb.url) : content_tag(:span, "イメージがありません")
      end
      row :avatar do |image|
        image.top_image.url.present? ? image_tag(image.avatar.thumb.url) : content_tag(:span, "イメージがありません")
      end
    end
  end 

  filter :name
  filter :email

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar
      f.input :top_image
    end
    f.actions
  end
end
