class UsersController < ApplicationController
  def index
    @following_users = current_user.following
    @memories = current_user.memories
  end

  def search
    @search_users = User.where('username LIKE(?)',"%#{params[:keyword]}%").order('username ASC').limit(20)
  end

  def show
    @user = User.find(params[:id])
    @friendship = current_user.following_to.find_by(follower_id: params[:id])
    @memories = @user.memories

    @memory_images = {}
    @memories.each do |memory|
      @memory_images[memory.date] = memory.image_url
    end
    gon.memory_images = @memory_images

    @tag_id = {}
    @tag_image = {}
    @memories.each do |memory|
      tag_image = []
      tag_user_id = memory.tag_list.uniq
      @tag_id[memory.date + "id"] = tag_user_id
      tag_user_id.each do |id|
        user = User.find(id)
        tag_image << user.avatar_url
      end
        @tag_image[memory.date + "image"] = tag_image
    end
    gon.tag_user_id = @tag_id
    gon.tag_image = @tag_image
  end
end
