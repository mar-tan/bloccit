class FavoriteMailer < ApplicationMailer
  default from: "mhwnotes@icloud.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}", cc: "xander.miller@gmail.com")
  end

  def new_post(user, post)
    headers["Message-ID"] = "<post/#{post.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<topic/#{post.topic.id}@your-app-name.example>"
    headers["References"] = "<topic/#{post.topic.id}@your-app-name.example>"

    @user = user
    @post = post
    # @topic = post.topic

    mail(to: user.email, subject: "New post on #{post.topic.name}", cc: "xander.miller@gmail.com")
  end
end
