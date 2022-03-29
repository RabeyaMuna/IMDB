class HomeController < ApplicationController
  def index
    @latest_collection = Post.order(created_at: :desc)
    @recent_released = Post.order(release_date: :desc)
  end
end
