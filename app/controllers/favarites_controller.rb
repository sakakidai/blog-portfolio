class FavaritesController < ApplicationController
  def create
    @favarite = current_user.favarites.build(blog_id: params[:blog_id])
    @favarite.save
    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.json { render json: @favarite }
    end
  end

  def destroy
    @favarite = Favarite.find_by(blog_id: params[:blog_id],
                                 user_id: current_user.id)
    @favarite.destroy
    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.json { render json: @favarite }
    end
  end
end

