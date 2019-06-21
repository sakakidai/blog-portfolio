class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]
  
  def index
    @blogs = Blog.recent.page(params[:page]).per(5)
    @picture_having_blogs = Blog.find(Image.picture_having)
    @categories = Category.all
    @post_ranking = User.find(Blog.post_ranking)
    @favarite_ranking = Blog.find(Favarite.iine_ranking)
    @comment = Comment.new
  end
  def show
    @comment = Comment.new
  end
  
  def new
    @blog = Blog.new
    @image = @blog.images.build
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      flash[:success] = "#{@blog.title} を作成しました。"
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    @image = @blog.images.build
  end

  def update
    if @blog.update(blog_params)
      flash[:success] = "#{@blog.title} を編集しました。"
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    flash[:success] = "#{@blog.title} を削除しました。"
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, category_ids: [], images_attributes: [:id, :title, :picture, :_destroy])
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
