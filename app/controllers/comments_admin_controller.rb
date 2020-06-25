class CommentsAdminController < ApplicationController
  before_action :check_for_login, :only => [:index]

  def index
    @comments = Comment.all
  end

  def remove
    
    comment = Comment.all.find_by(params[:id])
    comment.delete
    redirect_back :fallback_location => comments_admin_index_path
  end

end
