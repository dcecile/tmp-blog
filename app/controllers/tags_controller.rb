class TagsController < ApplicationController
  def index
    @tags = Tag.all
    random_article = Article.order("RANDOM()").first
    if random_article
      @edit_random_article_path = edit_article_path(random_article)
    else
      @edit_random_article_path = nil
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.destroy(params[:id])
    flash.notice = "The tag '#{@tag.name}' has been deleted."
    redirect_to tags_path
  end
end
