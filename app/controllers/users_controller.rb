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
    @comment = Comment.new

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
    gon.tag_user_id = @tag_id

    @comments = {}
    @memories.each do |memory|
      @comments[memory.date + "comments"] = memory.comments
    end
    gon.comments = @comments
    gon.current_user = current_user.id

    @memory_id = {}
    @memories.each do |memory|
      @memory_id[memory.date] = memory.id
    end
    gon.memory_id = @memory_id
  end

  def follows
    @follows = current_user.following
    @tags = []
    current_user.memories.each do |memory|
      @tags.concat(memory.tag_list)
    end
    @tagging_count = @tags
    @tag_user = @tagging_count.group_by {|item| item.to_i}
    gon.follows_count = @follows.count
  end
end
