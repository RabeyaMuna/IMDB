class HomeController < ApplicationController
  def index
    # @popular_collection = Post
    @latest_collection = Post.order(created_at: :desc)
    @latest_released = Post.order(release_date: :desc)
  end
end
