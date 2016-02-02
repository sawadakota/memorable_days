class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @friendship = current_user.following_to.create(follower_id: params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
  end
end
