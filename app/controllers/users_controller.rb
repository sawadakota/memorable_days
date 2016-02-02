class UsersController < ApplicationController
  def index
  end

  def search
    @search_users = User.where('username LIKE(?)',"%#{params[:keyword]}%").order('username ASC').limit(20)
  end

  def show
    @user = User.find(params[:id])
    @friendship = current_user.following.find_by(follower_id: params[:id])
  end
end
