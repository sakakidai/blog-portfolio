class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(content: params[:comment][:content],
                                          blog_id: params[:blog_id])
    comment.save
    redirect_to blogs_path
  end

  def destroy
    comment = Comment.find_by(user_id: current_user.id,
                              blog_id: params[:blog_id])
    comment.destroy
    redirect_to blogs_path
  end
end
