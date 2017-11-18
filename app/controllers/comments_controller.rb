class CommentsController < ApplicationController
  include CommentsHelper
  include ApplicationController::AuthorName

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(
      merge_random_author_name!(comment_params)
    )
    flash.notice = "Your comment is posted!"
    redirect_to article_path(@comment.article)
  end
end
