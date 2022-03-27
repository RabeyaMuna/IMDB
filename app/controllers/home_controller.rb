class HomeController < ApplicationController
  def index
    @latest_collection = Post.order(created_at: :desc)
    @recent_released = Post.order(release_date: :desc)
    @movie_collection = Post.where(category: :movie)
    @music_video_collection = Post.where(category: :music_video)
    @short_film_collection = Post.where(category: :short_film)
  end
end
