class CommentsController < ApplicationController
  respond_to :html

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])

    if params[:comment_id]
      @post.recursive_find_comment(params[:comment_id]).child_comments << @comment
    else
      @post.comments << @comment
    end

    respond_with @post
  end
end
