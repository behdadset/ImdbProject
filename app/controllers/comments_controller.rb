class CommentsController < ApplicationController
  before_action :check_for_login

  def remove
    comm = Comment.find_by(:title => params["movie_title"])
    @current_user.comments.find(comm.id).destroy
    redirect_back :fallback_location => movies_path
  end


  def create
    comment = Comment.new comment_params
    @current_user.comments << comment
    redirect_back :fallback_location => movies_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :title)
  end
end
