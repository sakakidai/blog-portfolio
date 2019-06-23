ActiveAdmin.register Comment do
  permit_params :content, :user_id, :blog_id


end
