class FavaritesController < ApplicationController
  def create
    favarite = current_user.favarites.build(blog_id: params[:blog_id])
    favarite.save
    redirect_to blogs_path
  end

  def destroy
    favarite = Favarite.find_by(blog_id: params[:blog_id], user_id: current_user.id)
    favarite.destroy
    redirect_to blogs_path
  end
end
