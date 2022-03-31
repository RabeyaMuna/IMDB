class PostRatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    check_user_post_rating

    if @post_rating.save!
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def post_rating_params
    params.require(:post_rating).permit(:rating, :post_id).merge(user_id: current_user.id)
  end

  def check_user_post_rating
    @post_rating = PostRating.find_by(post_id: @post.id, user_id: current_user.id)
    if @post_rating.present?
       @post_rating.assign_attributes(post_rating_params)
    else
     @post_rating = @post.post_ratings.new(post_rating_params)
    end
  end

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end
end
