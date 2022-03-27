class UsersController < ApplicationController
  
    def index
        # @limit = params.dig(:user, :limit) ? params[:user][:limit] : User.default_per_page
        # @users = sorted_index(User).accessible_by(current_ability).page(params[:page]).per(@limit)
        @users = User.order(created_at: asc)
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          # flash[:success] = I18n.t('notice.create.success', resource: User.model_name.human)
          redirect_to users_path
        else
          # flash[:error] = I18n.t('notice.create.fail', resource: User.model_name.human)
          render :new
        end
      end

      def show
        @user = User.find(params[:id])
      end
    
      def update
        if @user.update(user_params)
          # flash[:success] = I18n.t('notice.update.success', resource: User.model_name.human)
          redirect_to users_path
        else
          # flash[:error] = I18n.t('notice.update.fail', resource: User.model_name.human)
          render :edit
        end
      end
    
      def destroy
        if @user.destroy
          flash[:success] = I18n.t('notice.delete.success', resource: User.model_name.human)
        else
          flash[:error] = I18n.t('notice.delete.fail', resource: User.model_name.human)
        end
        redirect_to users_path
      end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :email, :encrypted_password, :phone, :role, :avatar)
      end
    
      def access_redirect(error)
        if current_user.admin?
          access_denied(error)
        else
          redirect_to user_path(current_user.id)
        end
      end
end
