module UsersHelper
  def has_posts?(user)
    if @user.posts.count > 0
      return true
    end
  end

  def has_comments?(user)
    if @user.comments.count > 0
      return true
    end
  end
end
