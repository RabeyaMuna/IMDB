class PostRatingsController < ApplicationController
  before_action :find_post

  def create
    check_user_post_rating
    @post_rating.save
  end

  def update
    @post_rating = PostRating.find_by(id: params[:rating][:id])
    if @post_rating.update(post_rating_params)
      render :show
    else
      render json: @post_rating.errors.full_messages, status: 422
    end
  end

  private

  def post_rating_params
    params.require(:post_rating).permit(:rating, :post_id).merge(user_id: current_user.id)
  end

  def check_user_post_rating
    exsisting_post_rating = @post.post_ratings.find_by(user_id: current_user.id, id: params[:id])
    if check_user_rating_exsistence.present?
      exsisting_post_rating.assign_attributes(post_rating_params)
    else 
      @post_rating = @post.new(post_rating_params)
    end
  end

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end
end
