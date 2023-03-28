class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update!(comment_params)
    post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy!

    redirect_to post_path(@post) 
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
