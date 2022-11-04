class PostsController < ApplicationController
  def index; end

  def show
    @posts = Post.find(params[:id])
  end
end
