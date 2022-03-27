class PostRatingsController < ApplicationController
  def index
    @post_ratings = PostRating.all.where(post_id: params[:id])
    render :index
  end

  def create
    @post_rating = PostRating.new(post_rating_params)
    if @post_rating.save
      render :show
    else
      render json: @post_rating.errors.full_messages, status: 422
    end
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
    params.require(:post_rating).permit(:rating, :post_id, :user_id)
  end
end
