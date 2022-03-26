class PostsController < ApplicationController
  def index
    # @limit = params.dig(:user, :limit) ? params[:user][:limit] : User.default_per_page
    # @users = sorted_index(User).accessible_by(current_ability).page(params[:page]).per(@limit)
    @users = Book.order(created_at: desc)
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
    if @user.update(post_params)
      flash[:success] = I18n.t('notice.update.success', resource: Post.model_name.human)
      redirect_to posts_path
    else
      flash[:error] = I18n.t('notice.update.fail', resource: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = I18n.t('notice.delete.success', resource: User.model_name.human)
    else
      flash[:error] = I18n.t('notice.delete.fail', resource: User.model_name.human)
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :email, :password, :phone, :role, :avatar)
  end
end
