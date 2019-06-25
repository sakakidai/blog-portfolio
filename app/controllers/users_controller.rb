class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show follows followers]

  def index
    @users = User.recent.page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.recent.page(params[:page]).per(10)
    @comment = Comment.new
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings.recent.page(params[:page]).per(12)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.recent.page(params[:page]).per(12)
  end
end
