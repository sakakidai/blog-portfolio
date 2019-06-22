ActiveAdmin.register Blog do
  permit_params :title, :body, :user_id, images_attributes: [:id, :title, :picture, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :user
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :body
  filter :user

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :body
    end

    f.inputs do
      f.has_many :images, heading: 'Images', allow_destroy: true, new_record: true do |image|
      image.input :picture, :hint => image.object.picture.present? ? image_tag(image.object.picture.thumb.url) : content_tag(:span, "まだイメージがありません。")
      end
    end
    f.actions
  end
end
