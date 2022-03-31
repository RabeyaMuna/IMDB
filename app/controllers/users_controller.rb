class UsersController < ApplicationController
 
    def index
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
        @user = User.find_by(id: params[:id])
      end
    
      def update
        redirect_to user_path if @user.update(user_params)
      end
    
      def destroy
        @user.destroy!
        redirect_to root_path
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
