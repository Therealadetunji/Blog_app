class PostsController < ApplicationController
  def index; end

  def show
    @posts = Post.new(params[:id])
  end
end
