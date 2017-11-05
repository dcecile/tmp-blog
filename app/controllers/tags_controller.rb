class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.destroy(params[:id])
    flash.notice = "The tag '#{@tag.name}' has been destroyed..."
    redirect_to tags_path
  end
end
