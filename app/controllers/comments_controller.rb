class CommentsController < ApplicationController
  def create
    current_user.comments.create(comment_params)
    redirect_to :back
  end

  private
  def comment_params
    params.permit(:text, :user_id, :memory_id)
  end
end
