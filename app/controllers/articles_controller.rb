class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.recent_order
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article_id: @article.id)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(
      article_params.merge!(author_name: "A. Non")
    )
    flash.notice = "Your article '#{@article.title}' is now posted!"
    redirect_to article_path(@article)
  end

  def update
    @article = Article.update(params[:id], article_params)
    flash.notice = "The article '#{@article.title}' is now updated!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.destroy(params[:id])
    flash.notice = "The article '#{@article.title}' has been deleted."
    redirect_to articles_path
  end
end
