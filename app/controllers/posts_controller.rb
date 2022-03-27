class PostsController < ApplicationController
  def index
    if params[:category].present?
      @posts = Post.where(category: params[:category])
    else
      @posts = Post
    end.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = I18n.t('notice.create.success', resource: Post.model_name.human)
      redirect_to posts_path
    else
      flash[:error] = I18n.t('notice.create.fail', resource: Post.model_name.human)
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = I18n.t('notice.update.success', resource: Post.model_name.human)
      redirect_to posts_path
    else
      flash[:error] = I18n.t('notice.update.fail', resource: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = I18n.t('notice.delete.success', resource: User.model_name.human)
    else
      flash[:error] = I18n.t('notice.delete.fail', resource: User.model_name.human)
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(
      :user_id,
      :name,
      :category,
      :description,
      :release_date,
      :link,
      cast_crews_attributes: %i(id :name :cast_type _destroy),
    ).merge({ user_id: current_user.id })
  end
end
