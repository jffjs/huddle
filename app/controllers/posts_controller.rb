class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
    respond_with @posts
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = "Successfully created post."
    end

    respond_with @post
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = Comment.new
    respond_with @post
  end
end
