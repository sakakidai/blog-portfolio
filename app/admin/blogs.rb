ActiveAdmin.register Blog do
  permit_params :title, :body, :user_id, images_attributes: [:id, :title, :picture, :_destroy],category_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :user
    column :categories
    column :images
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :user
      row :categories
      row :images
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :title
  filter :body
  filter :user
  filter :categories
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :body
      f.collection_check_boxes :category_ids, Category.all, :id, :name do |category|
        category.label(class: "checkbox-inline") { category.check_box(class: 'checkbox') + category.text }
      end
    end
    f.inputs do
      f.has_many :images, heading: 'Images', allow_destroy: true, new_record: true do |image|
      image.input :picture, :hint => image.object.picture.present? ? image_tag(image.object.picture.thumb.url) : content_tag(:span, "まだイメージがありません。")
      end
    end
    f.actions
  end
end

