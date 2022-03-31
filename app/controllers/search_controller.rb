class SearchController < ApplicationController
  def search_with_gem
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
