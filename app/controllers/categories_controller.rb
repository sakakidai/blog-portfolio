class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.name} カテゴリーを作成しました"
      redirect_to categories_path
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @blogs = @category.blogs.page(params[:page]).per(10)
    @comment = Comment.new
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.name} カテゴリーを編集しました"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "#{@category.name} カテゴリーを削除しました"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
