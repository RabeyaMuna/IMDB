class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, :except => :show

  def index
    @users = User.order(created_at: :asc)
    authorize @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path
    else
      render :new
    end
  end

  def show
  end

  def update
    redirect_to admin_user_path if @user.update(user_params)
  end

  def destroy
    authorize @user
    
    @user.destroy!

    if current_user.nil?
      redirect_to root_path
    else
      redirect_to admin_users_path
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :avatar)
  end

  def access_redirect(error)
    if current_user.admin?
      access_denied(error)
    else
      redirect_to admin_user_path(current_user.id)
    end
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
