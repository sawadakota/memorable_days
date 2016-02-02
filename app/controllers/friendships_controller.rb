class FriendshipsController < ApplicationController
  def create
    currnt_user.friendship.create
  end
end
