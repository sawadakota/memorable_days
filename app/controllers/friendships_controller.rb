class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.following.create(follower_id: params[:user_id])
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
  end
end
