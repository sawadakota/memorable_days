class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.following.create(follower_id: params[:user_id])
  end
end
