class MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end

  def create
    redirect_to :back
  end
end
