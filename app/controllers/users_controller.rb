class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
    @avatar = @user.avatar
    @top_image = @user.top_image
  end
end
