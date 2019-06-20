class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = User.recent.page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.recent.page(params[:page]).per(10)
  end
end
