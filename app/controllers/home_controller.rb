class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @blogs = Blog.recent.page(params[:page]).per(15)
    @comment = Comment.new
  end
end
