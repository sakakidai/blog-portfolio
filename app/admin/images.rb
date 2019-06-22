ActiveAdmin.register Image do

  show do |item_image|
    attributes_table do
      row :title
      row :picture do |image|
        image_tag(image.picture.thumb.url)
      end
      row :blog
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :picture do |image|
      image_tag(image.picture.thumb.url)
    end
    column :blog
    column :created_at
    column :updated_at
    actions
  end
end
