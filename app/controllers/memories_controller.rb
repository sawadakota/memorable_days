class MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end

  def create
    redirect_to :root
    current_user.memories.create(memory_params)
  end

  def edit
    @memory = Memory.find(params[:id])
    @ids = @memory.tag_list
    @users = User.find(@ids)
  end

  def update
    redirect_to :root
    @memory = Memory.find(params[:id])
    @memory.update(memory_params)
  end

  def search
    @search_users = User.where('username LIKE(?)',"%#{params[:keyword]}%").order('username ASC').limit(20)
  end

  def add_tag_friend
    @user = User.find(params[:user_id])
  end

  private
  def memory_params
    tag_list = params[:tag_list]
    params.require(:memory).permit(:text, :image, :user_friend, :no_user_friend, :date).merge(tag_list: tag_list)
  end
end
