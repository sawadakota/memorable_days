class MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end

  def create
    redirect_to :root
    current_user.memories.create(memory_params)
  end



  private
  def memory_params
    params.require(:memory).permit(:text, :image, :user_friend, :no_user_friend)
  end
end
