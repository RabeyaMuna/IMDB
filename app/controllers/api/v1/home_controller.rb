class HomeController < ApplicationController
  def index
    @top_rated_collection = Post.where("score > 3")
    @latest_collection = Post.order(created_at: :desc)
    @recent_released = Post.order(release_date: :desc)
  end
end
