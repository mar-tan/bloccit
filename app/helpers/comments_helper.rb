module CommentsHelper
  def user_is_authorized_for_comment?(comment)
    current_user && (current_user == comment.user || current_user.admin?)
  end

  # def get_comment_parent(comment)
  #   if comment.topic_id?
  #     return comment.topic
  #   elsif comment.post_id?
  #     return comment.post
  #   end
  # end
end
