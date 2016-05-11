class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    @parent = get_parent()
    comment = @parent.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved successfully."
    else
      flash[:alert] = "Comment failed to save."
    end
    redirect_to get_redirect_to(comment)
  end

  def destroy
    @parent = get_parent()
    comment = @parent.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted successfully."
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
    end
    redirect_to get_redirect_to(comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to get_redirect_to(comment)
    end
  end

  def get_parent
    if params[:topic_id]
      return Topic.find(params[:topic_id])
    elsif params[:post_id]
      return Post.find(params[:post_id])
    end
  end

  def get_redirect_to(comment)
    if comment.post
      return [comment.post.topic, comment.post]
    else
      return comment.topic
    end
  end

end
