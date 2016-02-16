class CommentsController < ApplicationController
  # skip_before_filter :verify_authenticity_token ,:only=>[:index]
  # protect_from_forgery except: [:some_action1, :some_action2]

  def create
    current_user.comments.create(comment_params)
    redirect_to :root
  end

  private
  def comment_params
    params.require(:comments).permit(:text).mwrge(user_id: current_user.id)
  end
end
