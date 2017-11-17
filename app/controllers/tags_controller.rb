class TagsController < ApplicationController
  def index
    @tags = Tag.all
    random_article = Article.order("RANDOM()").first
    @edit_random_article_path =
      random_article ? edit_article_path(random_article) : nil
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
