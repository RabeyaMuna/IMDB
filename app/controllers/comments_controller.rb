class CommentsController < ApplicationController
  def index
    @comments = Comment.all.where(post_id: params[:id])
    render :index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      render :show
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.where(user_id: current_user.id)
    if @comment.save
      render :show
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def update
    @comment = Comment.find_by(post_id: params[:post_id], user_id: current_user.id)
    if @comment.update(comment_params)
      render :show
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = Comment.find_by(post_id: params[:post_id], user_id: current_user.id)
    @comment.destroy!
    redirect_to root_path 
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :comment)
  end
end
