class UsersController < ApplicationController
  def index
    @following_users = current_user.following
  end

  def search
    @search_users = User.where('username LIKE(?)',"%#{params[:keyword]}%").order('username ASC').limit(20)
  end

  def show
    @user = User.find(params[:id])
    @friendship = current_user.following_to.find_by(follower_id: params[:id])
  end
end
