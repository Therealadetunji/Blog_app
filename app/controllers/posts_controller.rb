class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end
end

def new
  @post = Post.new
end

def create
  @post = current_user.posts.new(post_param[:id])
  respond_to do |format|
    format.html do
      if @post.save
        redirect_to user_post_path(current_user, @post), notice: 'Post was created.'
      else
        render :new, status: 'Error: Post was not created.'
      end
    end
  end
end

def post_param
  params.require(:post).permit(:title, :text)
end
