class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  before_action :find_post, only: %i(edit show update destroy)

  def new
    @post = Post.new
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.with_attached_images.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = I18n.t('notice.create.success', resource: Post.model_name.human)
      redirect_to root_path
    else
      flash[:error] = I18n.t('notice.create.fail', resource: Post.model_name.human)
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy!
      flash[:success] = I18n.t('notice.delete.success', resource: User.model_name.human)
    else
      flash[:error] = I18n.t('notice.delete.fail', resource: User.model_name.human)
    end
    redirect_to posts_path
  end

  def show_comment
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    render :index
  end

  private

  def post_params
    params.require(:post).permit(
      :name,
      :description,
      :release_date,
      :link,
      :trailer,
      :poster,
      :director_name,
      :producer_name,
      :cast_name,
      images: [],
    ).merge({ user_id: current_user.id })
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
